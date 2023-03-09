import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/cart/viewmodel/cart_viewmodel.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/styled_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Locator.dart';
import '../../../account/viewmodel/account_viewmodel.dart';
import '../../../account/widgets/address_list_item.dart';
import '../../widgets/shimmer_address_item.dart';
class AddressPage extends StatelessWidget {
  final CartViewModel viewModel;
  const AddressPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<CartViewModel>(
      onModelReady: (_){
          viewModel.generateChecks();
           viewModel.getMyAddresses(context);
      },
      builder: (_, vm, child){
        return Column(
          children: [
           // heightSpace(50.h),
            // Row(
            //   children: [
            //     Container(
            //       width: 24.w,
            //       height: 24.h,
            //       decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: secondaryColor
            //       ),
            //       child: Center(
            //           child: Icon(Icons.done, color: whiteColor, size: 13.w,)
            //       ),
            //     ),
            //     widthSpace(5.w),
            //     SizedBox(
            //         width: 250.w,
            //         child: bold14Text('Billing address is the same as delivery address')
            //     )
            //   ],
            // ),
           // heightSpace(50.h),
          viewModel.addresses==null ? ShimmerAddressItem() :  ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return _addressListItem(
                    address: viewModel.addresses![i],
                    i : i,
                    vm: viewModel
                );
              },
              itemCount: viewModel.addresses!.length,
            ),
            // StyledTextField(labelText: 'Street 1'),
            // heightSpace(30.h),
            // StyledTextField(labelText: 'Street 2'),
            // heightSpace(30.h),
            // StyledTextField(labelText: 'City'),
            // heightSpace(30.h),
            // Row(
            //   children: [
            //     Expanded(
            //         flex:1,
            //        child: StyledTextField(labelText: 'State')),
            //     widthSpace(37.w),
            //     Expanded(
            //         flex: 1,
            //         child: StyledTextField(labelText: 'Country')),
            //   ],
            // ),
            heightSpace(30.h),
          ],
        );
      },
    );

  }
  _addressListItem({dynamic address , required int i, required CartViewModel vm}){
    return Container(
      color: whiteColor,
      margin: EdgeInsets.only(bottom: 30.h),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h, left: 5.w, right: 5.w, top: 10.h),
        child: Column(
          children: [
            Row(
              children: [
                bold18Text('Home Address'),
              ],
            ),
            heightSpace(20.h),
            Row(
              children: [
                Container(
                  width: 280.w,
                  child: normal14Text('${address.address} , ${address.street} , ${address.city},  ${address.state}, ${address.country}') ,
                ),
                Spacer(),
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: secondaryColor, width: 1.w),
                    color: vm.checkAddress[i] ==true ? secondaryColor: whiteColor,
                  ),
                  child: Center(
                      child: Icon(Icons.done, color: whiteColor, size: 13.w,)
                  ),
                ).onTap((){
                  vm.setSelectedAddressId(address.id, i);
                })
              ],
            )
          ],
        ),
      ),
    );
  }

}
