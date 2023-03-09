import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/cart/viewmodel/cart_viewmodel.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/texts.dart';

import '../../widgets/shimmer_address_item.dart';
class PaymentPage extends StatelessWidget {
  final CartViewModel viewModel;
  const PaymentPage({Key? key, required this.viewModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<CartViewModel>(
      onModelReady: (_){
        viewModel.generateChecks();
        viewModel.getPaymentsMethods(context);
      },
      builder: (_, vm, child){
        return Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             viewModel.paymentMethods ==null ? ShimmerAddressItem() : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return  _buildCardWidget(viewModel, i,
                      Image.network('https://cdn-icons.flaticon.com/png/512/2058/premium/2058414.png?token=exp=1652981063~hmac=9b1e5cddc19bf4d1ccac33289dfb18b0',
                    /*color: HexColor('#BEBEBE',),*/ width: 40.w, height: 40.h,),
                      whiteColor, viewModel.paymentMethods![i].name);
                },
                itemCount: viewModel.paymentMethods!.length,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child:   _buildCardWidget(Image.asset('assets/icons/paypal.png',
              //         color: HexColor('#BEBEBE',), width: 20.w, height: 17.h,), whiteColor),
              //     ),
              //     widthSpace(14.w),
              //     Expanded(
              //       flex: 1,
              //       child: _buildCardWidget(Image.asset('assets/icons/wallet.png',
              //         color: whiteColor, width: 20.w, height: 17.h,), secondaryColor),
              //     ),
              //     widthSpace(14.w),
              //     Expanded(
              //       flex: 1,
              //       child: _buildCardWidget(Image.asset('assets/icons/wallet.png',
              //         color: HexColor('#BEBEBE',), width: 20.w, height: 17.h,), whiteColor),
              //     ),
              //   ],
              // ),
              heightSpace(30.h),
            // _buildPayCardWidget()
            ],
          ),
        );
      },
    );

  }

  // _buildPayCardWidget(){
  //   return   Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       StyledTextField(labelText: 'Name on Card',),
  //       heightSpace(30.h),
  //       StyledTextField(labelText: 'Card Number',suffixWidget: Image.asset('assets/icons/Icon_MasterCard.png'),),
  //       heightSpace(30.h),
  //       Row(
  //         children: [
  //           Expanded(
  //               flex:1,
  //               child: StyledTextField(labelText: 'Expiry Date')),
  //           widthSpace(37.w),
  //           Expanded(
  //               flex: 1,
  //               child: StyledTextField(labelText: 'CVV')),
  //         ],
  //       ),
  //       heightSpace(40.h),
  //       Row(
  //         children: [
  //           Container(
  //             width: 24.w,
  //             height: 24.h,
  //             decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 color: secondaryColor
  //             ),
  //             child: Center(
  //                 child: Icon(Icons.done, color: whiteColor, size: 13.w,)
  //             ),
  //           ),
  //           widthSpace(5.w),
  //           bold14Text('Save this card details')
  //         ],
  //       ),
  //     ],
  //   );
  // }

  _buildCardWidget(CartViewModel viewModel ,index,  icon, color, name){
      return Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/icons/wallet.png', width: 40.w, height: 40.h,),
            widthSpace(10.w),
            bold16Text(name),
            Spacer(),
            _buildCheckBoxWidget(viewModel, index)
          ],
        ),
      );
    }

    _buildCheckBoxWidget(CartViewModel vm,  index){
      return  Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: whiteColor,
              border: Border.all(color: Colors.grey, width: 1.w)
          ),
          child: Center(
            child: Container(
              width: 14.w,
              height: 14.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: vm.checkPayment[index]==true ?  secondaryColor: whiteColor,
              ),
            ),
          )
      ).onTap((){
        vm.selectPaymethods(index);
      });

    }
  }
  // _buildCardWidget(CartViewModel viewModel ,index,  icon, color, name){
  //   return Container(
  //     height: 60.h,
  //     width: 100.w,
  //     margin: EdgeInsets.only(right: 10.w),
  //     decoration: BoxDecoration(
  //         color: whiteColor,
  //        // color: viewModel.checks[index]==true ?  secondaryColor : whiteColor,
  //         borderRadius: BorderRadius.all(Radius.circular(4.w)),
  //         border: Border.all(color: viewModel.checks[index]==true ?  secondaryColor : whiteColor, width: 1.w)
  //     ),
  //     child: Center(
  //         child: icon
  //     ),
  //   ).onTap((){
  //     viewModel.selectPaymethods(index);
  //   });
  //
  // }
