import 'package:bargina/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Locator.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/texts.dart';
import '../../../widgets/rounded_textfield.dart';
import 'package:hexcolor/hexcolor.dart';

class AddCopounPage extends StatelessWidget {

  final productId;
  const AddCopounPage({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AccountViewModel>(
      onModelReady: (_){
        _.setInitDate();
      },
      builder: (_, vm, child){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: bold16Text('Add Coupon', color: whiteColor),
            centerTitle: true,
            leading: Icon(
              Icons.arrow_back_ios_outlined,
              color: whiteColor,
              size: 30.w,
            ).onTap((){
              locator<NavigationService>().goBack();
            }),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bold16Text('Add Discount'),
                    heightSpace(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: _buildLabelText('Price'),
                        ),
                        Expanded(
                          flex: 1,
                          child: _buildLabelText('Country Fee'),
                        ),
                        Expanded(
                          flex: 1,
                          child: _buildLabelText('Price+Fees'),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: RoundedStyledTextField(
                              labelText: '',
                              controller: vm.priceController,
                              keyboardType: TextInputType.number,
                            )),
                        widthSpace(10.w),
                        Expanded(
                            flex: 1,
                            child: RoundedStyledTextField(
                              labelText: '',
                              controller: vm.countryFeeController,
                              keyboardType: TextInputType.number,
                            )),
                        widthSpace(10.w),
                        Expanded(
                            flex: 1,
                            child: RoundedStyledTextField(
                              labelText: '',
                              keyboardType: TextInputType.number,
                              controller: vm.priceFeeController,
                            )),
                      ],
                    ),
                    heightSpace(40.h),
                    Row(
                      children: [
                        reg14Text('Total Price'),
                        widthSpace(15.w),
                        Expanded(
                            flex: 3,
                            child: RoundedStyledTextField(
                              labelText: '',
                              keyboardType: TextInputType.number,
                              controller: vm.totalPriceController,
                            )),
                      ],
                    ),
                    heightSpace(30.h),
                    Row(
                      children: [
                        _buildDateContainer(vm.startDate, vm, context,  1),
                         widthSpace(15.w),
                         reg14Text('The star date of discount')
                      ],
                    ),
                    heightSpace(10.h),
                    Row(
                      children: [
                        _buildDateContainer(vm.endDate, vm, context, 0),
                        widthSpace(15.w),
                        reg14Text('The end date of discount')
                      ],
                    ),
                    heightSpace(50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StyledButton(
                            fillColor: primaryColor,
                            width: 90.w,
                            function: (){
                              locator<NavigationService>().goBack();
                            }, child: bold14Text('CLOSE', color: whiteColor)),
                        widthSpace(20.w),
                        StyledButton(
                            fillColor: secondaryColor,
                            width: 90.w,
                            function: (){
                              vm.addDiscount(context, productId);
                            }, child: bold14Text('SAVE', color: whiteColor))
                      ],
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

  _buildDateContainer(date, AccountViewModel vm, BuildContext context, int index){
     return Container(
       width: 100.w,
       height: 40.h,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(5.w)),
         color: HexColor('#E2E2E2')
       ),
       child:Center(
           child: reg14Text(date)),
     ).onTap((){
       vm.selectDate(context, index);
     });
  }
  
  _buildLabelText(text) {
    return RichText(
        text: TextSpan(
            text: '*',
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
