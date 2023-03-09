import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/screens/payment/enums/brand_type.dart';
import 'package:bargina/screens/payment/models/card_info.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Locator.dart';
import '../../../../../services/navigation_service.dart';
import '../../../../../widgets/styled_button.dart';
import '../../../../payment/enums/payment_status.dart';
import '../../../../payment/hyperpay.dart';
import '../../../../payment/models/apple_pay_settings.dart';
import '../../../../payment/payment_page.dart';
import '../../../BaseScreen.dart';
import '../../viewmodel/cart_viewmodel.dart';
import '../../widgets/shimmer_address_item.dart';

HyperpayPlugin hyperpay= HyperpayPlugin("LIVE");

class SummaryPage extends StatelessWidget {
  final id;
  CartViewModel viewModel;
  final bool digital;
  dynamic quantity;
  dynamic payment;
  dynamic productid;

  SummaryPage({Key? key, required this.id, required this.viewModel,
    required this.payment, required this.quantity, required this.productid, required this.digital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<CartViewModel>(
      onModelReady: (_)  async{
         // setup(context);
        _.calculateShippingPrice(context, productid, quantity, viewModel);
        _.getOrderDetails(context, id).whenComplete(() {
        });
      },
      builder: (_, vm, child){
        return Scaffold(
          appBar:AppBar(
            backgroundColor: primaryColor,
            title: reg20Text('Summary', color: whiteColor),
            centerTitle: true,
            leading: Icon(Icons.arrow_back_ios_outlined, color: whiteColor, size: 20.w,).onTap((){
              locator<NavigationService>().goBack();
            }),
          ),
          body: SafeArea(
            child: vm.orderDetailsModel==null ?  ShimmerAddressItem()
                : SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height* 0.9,
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child:  _buildItemList(vm.orderDetailsModel['order_detail']),
                          ),

                          // Center(
                          //   child: SizedBox(
                          //     height: 200.h,
                          //     child: ListView.builder(
                          //       shrinkWrap: true,
                          //       scrollDirection: Axis.horizontal,
                          //       physics: const BouncingScrollPhysics(),
                          //       itemBuilder: (context, i) {
                          //         return _buildItemList(vm.orderDetailsModel['order_detail']);
                          //       },
                          //       itemCount: 1,
                          //     ),
                          //   ),
                          // ),
                          heightSpace(10.h),
                          Divider(height: 2.h,),
                          heightSpace(10.h),
                          bold18Text('Shipping Address'),
                          heightSpace(10.h),
                          _buildAddressItem(vm),
                          heightSpace(40.h),
                          Visibility(
                            visible: payment.id== 5 ? true : false,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  heightSpace(30.h),
                                  bold18Text('Order sent successfully', color: secondaryColor),
                                  heightSpace(10.h),
                                  StyledButton(function: (){
                                 locator<NavigationService>().navigateToAndClearStack(RouteName.MainPage);
                                  },fillColor: whiteColor,
                                    radius: true,
                                    child: reg14Text('DONE', color: secondaryColor), width: 100.w,  border: secondaryColor,),
                                ],
                              ),
                            ),
                          ),
                          heightSpace(20.h),
                          StyledButton(
                              fillColor: Colors.black,
                              function: () async{
                                String checkoutId= await  viewModel.checkoutpage(context, vm.shipPriceModel!.total.round().toString());
                                 onApplePay(context, vm.shipPriceModel!.total.toString(), id, checkoutId);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                bold7Text("Pay with", color: Colors.white),
                                widthSpace(5.w),
                                Image.asset('assets/icons/apple-pay.png', color: Colors.white),
                              ],
                          )),
                       /*   ApplePayButton(
                            paymentConfigurationAsset: 'applepay.json',
                            paymentItems: [
                              PaymentItem(
                                label: '$id',
                                amount: vm.shipPriceModel!.total.round().toString(),
                                status: PaymentItemStatus.final_price,
                              )
                            ],
                            style: ApplePayButtonStyle.black,
                            type: ApplePayButtonType.buy,
                            width: 200,
                            height: 50,
                            margin: const EdgeInsets.only(top: 15.0),
                            onPaymentResult: (value) {
                              print(value);
                            },
                            onError: (error) {
                              print(error);
                            },
                            loadingIndicator: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),*/
                          heightSpace(30.h)
                        ],
                      ),
                      Visibility(
                        visible: payment.id== 5 || digital==true ? false : true,
                        child: Positioned(
                          bottom: 50.h,
                          left: 0.w,
                          right: 0.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StyledButton(function: (){
                                locator<NavigationService>().goBack();
                              },fillColor: whiteColor, child: reg14Text('BACK', color: secondaryColor), width: 100.w,  border: secondaryColor,),
                              widthSpace(50.w),
                             viewModel.state==ViewState.Busy ? CircularProgressIndicator(
                               color: secondaryColor,
                             ) : StyledButton(
                                function: () async{
                                  String checkoutId= await  viewModel.checkoutpage(context, vm.shipPriceModel!.total.round().toString());
                                  Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) =>  PaymentPage(checkOutId: checkoutId, orderId: id)),
                                   );
                              },
                                fillColor: secondaryColor,
                                child: reg14Text('PAY', color: whiteColor),
                                width: 100.w,)
                            ],
                          ),
                        ),
                      ),

                      // StyledButton(
                      //     fillColor: Colors.black,
                      //     function: () async{
                      //       String checkoutId= await  viewModel.checkoutpage(context, vm.shipPriceModel!.total.round().toString());
                      //       onApplePay(context, vm.shipPriceModel!.total.toString(), id, checkoutId);
                      //     },
                      //     child: Row(
                      //     children: [
                      //     Image.asset('assets/icons/apple-pay.png', width: 20.w, color: Colors.white),
                      //     widthSpace(10.w),
                      //     bold16Text("Pay with Apple Wallet", color: Colors.white)
                      //   ],
                      // )),
                    ],
                  )
                ),
              ),
            ),
          ),

        );
      },
    );
  }


  void setup(BuildContext context) async{
    try {
      await hyperpay.setup(config: "live");
    } catch (exception) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$exception'),
        ),
      );
    }
  }

  void onApplePay(BuildContext context,  amount, orderId, checkoutId) async {

    final applePaySettings = ApplePaySettings(
      amount: amount,
      appleMerchantId: 'merchant.com.app.bargainia',
      countryCode: 'SA',
      currencyCode: 'SAR',
    );

    try {

      final result = await hyperpay.payWithApplePay(applePaySettings, checkoutId, orderId);

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
          var status =await  hyperpay.getpaymentstatus(checkoutId, "APPLE", orderId);
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
            const SnackBar(
              content: Text('Payment approved 🎉'),
              backgroundColor: Colors.green,
            ),
          );
          locator<NavigationService>().navigateToAndClearStack(RouteName.MainPage);
          break;
      }
    } on Exception catch (exception) {
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
  }

}



  _buildItemList(item){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 100.h,
          width: 100.w,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 10.w , bottom: 10.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.w)),
              border: Border.all(color: Colors.grey, width: 1.w)
          ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Center(
              child: CachedNetworkmage(url: 'https://phplaravel-425085-2297893.cloudwaysapps.com/storage/uploads/tmpphphlzcnw.png', width: 80.w, height: 80.h,),
            ),
          ),
        ),
        //heightSpace(10.h),
        med16Text(item['product_name']),
        med16Text('${item['price_after']} SAR', color: secondaryColor)
      ],
    );
  }
  _buildAddressItem(CartViewModel viewModel){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        reg16Text(viewModel.orderDetailsModel['ship_address']['company']),
        heightSpace(10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: 300.w,
                child: normal16Text('${viewModel.orderDetailsModel['ship_address']['street']}, ${viewModel.orderDetailsModel['ship_address']['city']}, '
                    '${viewModel.orderDetailsModel['ship_address']['state']}, ${viewModel.orderDetailsModel['ship_address']['country']}',)),
            Spacer(),
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondaryColor
              ),
              child: Center(
                  child: Icon(Icons.done, color: whiteColor, size: 13.w,)
              ),
            ),

          ],
        ),
        heightSpace(10.h),
        med14Text('Change', color: secondaryColor)

      ],
    );
  }
  _buildPaymentItem(item){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset('assets/icons/Icon_MasterCard.png'),
            widthSpace(27.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bold12Text('VISA', color: Colors.grey),
                bold16Text('**** **** **** 4543')
              ],
            ),
            Spacer(),
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondaryColor
              ),
              child: Center(
                  child: Icon(Icons.done, color: whiteColor, size: 13.w,)
              ),
            ),



          ],
        ),
        heightSpace(10.h),
        bold14Text('Change', color: secondaryColor)
      ],
    );

  }
