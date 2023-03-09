import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Locator.dart';
import '../new_shipping_address.dart';

class AddressListItem extends StatelessWidget {
  dynamic address;
  AccountViewModel viewModel;
   AddressListItem({Key? key,this.address, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      margin: EdgeInsets.only(bottom: 30.h),
  child: Padding(
    padding: EdgeInsets.all(16.w),
    child: Column(
      children: [
        Row(
          children: [
            bold18Text(address.address),
            Spacer(),
            Row(
              children: [
                _buildIconContainer('assets/icons/deleat.png', (){
                  viewModel.deleteAddress(context, address.id);
                }),
                widthSpace(6.w),
                _buildIconContainer('assets/icons/edit.png', (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewShippingAddressScreen(address: address)));
                })
              ],
            )
          ],
        ),
        heightSpace(20.h),
        Row(
          children: [
            Container(
              width: 280.w,
              child: reg14Text('${address.address} , ${address.street} , ${address.city},  ${address.state}, ${address.country}') ,
            ),
            Spacer(),
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: secondaryColor, width: 1.w),
                  color: address.def.toString()== '1' ?secondaryColor: whiteColor
              ),
              child: Center(
                child: Icon(Icons.done, color: whiteColor, size: 13.w,)
              ),
            ).onTap((){
              viewModel.setAddressAsDefault(context, address.id);
            })
          ],
        )
      ],
    ),
  ),
    );
  }
  _buildIconContainer(icon, fuction){
    return Container(
      width: 21.w,
      height: 21.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.w)),
        color: greyColor
      ),
      child: Center(
        child: Image.asset(icon, width: 21.w, height: 21.h, ),
      ),
    ).onTap((){
      fuction();
    });
  }
}
