import 'package:bargina/screens/payment/extensions/brands_ext.dart';
import 'package:bargina/screens/payment/formatters.dart';
import 'package:bargina/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Locator.dart';
import '../../routes/RoutesNames.dart';
import '../../services/navigation_service.dart';
import 'apple_pay_button.dart';
import 'enums/app_pay_button_type.dart';
import 'enums/apple_pay_button_style.dart';
import 'enums/brand_type.dart';
import 'enums/payment_status.dart';
import 'hyperpay.dart';
import 'models/apple_pay_settings.dart';
import 'models/card_info.dart';
import 'models/checkout_settings.dart';

class PaymentPage extends StatefulWidget {
  final String? checkOutId;
  final dynamic orderId;
  const PaymentPage({Key? key, required this.checkOutId, required this.orderId}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController holderNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  BrandType brandType = BrandType.none;

  bool isLoading = false;
  String sessionCheckoutID = '';

   HyperpayPlugin hyperpay= HyperpayPlugin("LIVE");

  @override
  void initState() {
    setup();
    super.initState();
  }

  setup() async {
   // hyperpay = await HyperpayPlugin.setup(config: "LIVE");
  }


  Future<void> onPay(context) async {
    final bool valid = Form.of(context)?.validate() ?? false;

    if (valid) {
      setState(() {
        isLoading = true;
      });

      // Make a CardInfo from the controllers
      CardInfo card = CardInfo(
        holder: holderNameController.text.toUpperCase(),
        cardNumber: cardNumberController.text.replaceAll(' ', ''),
        cvv: cvvController.text,
        expiryMonth: expiryController.text.split('/')[0],
        expiryYear: '20' + expiryController.text.split('/')[1],
      );

      try {

        final result = await hyperpay.pay(card, brandType, widget.checkOutId!, widget.orderId);

        switch (result) {
          case PaymentStatus.init:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Payment session is still in progress'),
                backgroundColor: Colors.amber,
              ),
            );
            break;
        // For the sake of the example, the 2 cases are shown explicitly
        // but in real world it's better to merge pending with successful
        // and delegate the job from there to the server, using webhooks
        // to get notified about the final status and do some action.
          case PaymentStatus.sync:
            var status = await hyperpay.getpaymentstatus(widget.checkOutId!, brandType.name, widget.orderId);
            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                content: Text('$status'),
                backgroundColor: Colors.amber,
              ),
            );
            locator<NavigationService>().navigateToAndClearStack(RouteName.MainPage);
            break;
          case PaymentStatus.successful:
            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                content: Text('Payment approved 🎉'),
                backgroundColor: Colors.green,
              ),
            );
            locator<NavigationService>().navigateToAndClearStack(RouteName.MainPage);
            break;

          default:
        }
      } on Exception catch (exception) {
        sessionCheckoutID = '';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(exception.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
      catch (exception) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('exception: $exception'),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });

    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.onUserInteraction;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            autovalidateMode: autovalidateMode,
            child: Builder(
              builder: (context) {
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    // Holder
                    TextFormField(
                      controller: holderNameController,
                      decoration: _inputDecoration(
                        label: "Card Holder",
                        hint: "CARD HOLDER",
                        icon: Icons.account_circle_rounded,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Number
                    TextFormField(
                      controller: cardNumberController,
                      decoration: _inputDecoration(
                        label: "Card Number",
                        hint: "0000 0000 0000 0000",
                        icon: brandType == BrandType.none
                            ? Icons.credit_card
                            : 'assets/${brandType.name}.png',
                      ),
                      onChanged: (value) {
                        setState(() {
                          brandType = value.detectBrand;
                          print('brand is : ${brandType.name}');
                        });
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(brandType.maxLength),
                        CardNumberInputFormatter()
                      ],
                      validator: (String? number) =>
                          brandType.validateNumber(number ?? ""),
                    ),
                    const SizedBox(height: 10),
                    // Expiry date
                    TextFormField(
                      controller: expiryController,
                      decoration: _inputDecoration(
                        label: "Expiry Date",
                        hint: "MM/YY",
                        icon: Icons.date_range_rounded,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        CardMonthInputFormatter(),
                      ],
                      validator: (String? date) =>
                          CardInfo.validateDate(date ?? ""),
                    ),
                    const SizedBox(height: 10),
                    // CVV
                    TextFormField(
                      controller: cvvController,
                      decoration: _inputDecoration(
                        label: "CVV",
                        hint: "000",
                        icon: Icons.confirmation_number_rounded,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                      validator: (String? cvv) =>
                          CardInfo.validateCVV(cvv ?? ""),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: ()async{
                        await  onPay(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor, // Background color
                        ),
                        child: Text(
                          isLoading
                              ? 'Processing your request, please wait...'
                              : 'PAY',
                        ),
                      ),
                    ),
                    // if (defaultTargetPlatform == TargetPlatform.iOS)
                    //   SizedBox(
                    //     width: double.infinity,
                    //     height: 35,
                    //     child: ApplePayButton(
                    //       onPressed: () => onApplePay(1, widget.orderId),
                    //       type: ApplePayButtonType.buy,
                    //       style: ApplePayButtonStyle.black,
                    //     ),
                    //   ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(
      {String? label, String? hint, dynamic icon}) {
    return InputDecoration(
      hintText: hint,
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      prefixIcon: icon is IconData
          ? Icon(icon)
          : Container(
        padding: const EdgeInsets.all(6),
        width: 10,
        child: Image.asset(icon),
      ),
    );
  }
}
