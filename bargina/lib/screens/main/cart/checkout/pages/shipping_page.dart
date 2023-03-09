import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/cart/viewmodel/cart_viewmodel.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/shimmer_address_item.dart';

class ShippingPage extends StatelessWidget {
  final CartViewModel viewModel;
  const ShippingPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Column(
      children: [
        viewModel.shippingMethods==null ? ShimmerAddressItem() : ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            return  _buildAddress(viewModel.shippingMethods![i], viewModel, i);
          },
          itemCount: viewModel.shippingMethods!.length,
        ),
        // Divider(
        //   color: Colors.grey,
        //   height: 2.h,
        // ),
        heightSpace(30.h),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     bold16Text('SubTotal'),
        //     Spacer(),
        //     bold18Text('65 SAR')
        //   ],
        // ),
        // heightSpace(30.h),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: [
        //     bold16Text('Tax'),
        //     Spacer(),
        //     bold18Text('65 SAR'),
        //   ],
        // ),
        // heightSpace(30.h),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: [
        //     bold16Text('SubTotal'),
        //     Spacer(),
        //     bold18Text('65 SAR'),
        //   ],
        // ),
        // heightSpace(30.h),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: [
        //     bold16Text('Tax'),
        //     Spacer(),
        //     bold18Text('65 SAR'),
        //   ],
        // ),
        heightSpace(30.h),
        Divider(
          color: Colors.grey[200],
          height: 2.h,
        ),

      ],
    );

  }
  _buildAddress(dynamic ship, CartViewModel cartViewModel, index){
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bold18Text(ship.name),
          heightSpace(10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 280.w,
                  child: reg14Text(ship.describe)),
              Spacer(),
              _buildCheckBoxWidget(cartViewModel, ship.id, index)
            ],
          )
        ],
      ),
    );
  }
  _buildCheckBoxWidget(CartViewModel vm, int id, index){
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
               color: vm.checkShips[index]==true ?  secondaryColor: whiteColor,
            ),
          ),
        )
    ).onTap((){
      vm.selectItem(index);
    });

  }

  }
