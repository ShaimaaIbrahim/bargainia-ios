import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../Locator.dart';
import '../../../../services/navigation_service.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/common_functions.dart';
import '../../../../widgets/rounded_textfield.dart';
import '../../../../widgets/styled_button.dart';
import '../../BaseScreen.dart';
import '../viewmodel/add_discount_viewmodel.dart';


String startDate =  DateFormat('yyyy-MM-dd').format(DateTime.now());

String endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

class AddDiscountPage extends StatefulWidget {
  final int? productId;

  const AddDiscountPage({Key? key, required this.productId}) : super(key: key);

  @override
  State<AddDiscountPage> createState() => _AddDiscountPageState();
}

class _AddDiscountPageState extends State<AddDiscountPage> {


  @override
  Widget build(BuildContext context) {
    return BaseScreen<AddDiscountViewmodel>(
      onModelReady: (_) {
        _.getFees(context);
      },
      builder: (_, vm, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: bold16Text('ADD DISCOUNT', color: whiteColor),
            centerTitle: true,
            leading: Icon(
              Icons.arrow_back_ios_rounded,
              color: whiteColor,
              size: 30.w,
            ).onTap(() {
              locator<NavigationService>().goBack();
            }),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: _buildLabelText('Add Discount'),
                        ),
                        Expanded(
                          flex: 1,
                          child: _buildLabelText('Country Fee *'),
                        ),
                        Expanded(
                          flex: 1,
                          child: _buildLabelText('Bargainia Fee *'),
                        )
                      ],
                    ),
                    heightSpace(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: RoundedStyledTextField(
                              labelText: '',
                              controller: vm.discountController,
                              keyboardType: TextInputType.number,
                              onChange: (_) {
                                vm.calculateTotal(_);
                              },
                            )),
                        widthSpace(10.w),
                        Expanded(
                          flex: 1,
                          child: RoundedStyledTextField(
                              labelText: '',
                              controller: vm.feebarginatController,
                              readOnly: true),
                        ),
                        widthSpace(10.w),
                        Expanded(
                          flex: 1,
                          child: RoundedStyledTextField(
                            labelText: '',
                            controller: vm.countryFeeController,
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    heightSpace(20.h),
                    Row(
                      children: [
                        Text('='),
                        widthSpace(10.w),
                        RoundedStyledTextField(
                          width: 200.w,
                            labelText: 'Total Price',
                            controller: vm.totalController,
                            keyboardType: TextInputType.number,
                            readOnly: true)
                      ],
                    ),
                    heightSpace(30.h),
                    Row(
                      children: [
                        _AddDate(context, 1),
                        bold14Text('the start  date of discount '),
                      ],
                    ),
                    heightSpace(10.h),
                    Row(
                      children: [
                        _AddDate(context, 2),
                        bold14Text('the end  date of discount '),

                      ],
                    ),
                    heightSpace(40.h),
                  vm.state ==ViewState.Busy ? CircularProgressIndicator(
                    color: primaryColor,
                  ):  StyledButton(
                      function: () {
                         vm.addDiscount(context , startDate , endDate, widget.productId);
                      },
                      child: semiBold14Text('Add',
                          color: whiteColor),
                      fillColor: primaryColor,
                      width: 110.w,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _AddDate(context,type){
    return Container(
      width: 150.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
          color: lightGrey),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 15.h, right: 15.w, left: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bold14Text(type==1 ? startDate: endDate, color: whiteColor),
              // widthSpace(49.w),
              Icon(Icons.calendar_month, color: whiteColor)
            ],
          ),
        ),
      ),
    ).onTap(() async{
      var date = await showDatePickerFun(context);
      setState(() {
        type==1 ? startDate= date: endDate= date;
      });
      // widget.setDtae(date);
    });
  }
  
  _buildLabelText(text) {
    return RichText(
        text: TextSpan(
            text: '',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.red),
            children: [
          TextSpan(
              text: text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                color: textColor,
              ))
        ]));
  }
}
