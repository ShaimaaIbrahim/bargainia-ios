import 'package:bargina/screens/main/account/model/order_model.dart';
import 'package:bargina/screens/main/account/orders/order_details_screen.dart';
import 'package:bargina/screens/main/account/widgets/status_widget.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import 'package:hexcolor/hexcolor.dart';
class OrderListItem extends StatelessWidget {

  OrderModel order;
   OrderListItem({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: whiteColor,
        margin: EdgeInsets.only(bottom: 26.h),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            children: [
              Row(
                children: [
                  med16Text('OD- ${order.orderId} - N'),
                  Spacer(),
                  bold16Text('${order.finalAmount} SAR', color: secondaryColor)
                ],
              ),
              heightSpace(10.h),
              Row(
                children: [
                  reg14Text(order.createdAt ?? 'Sept 18, 2021', color: additionColor),
                  Spacer(),
                  StatusWidget(fillColor: secondaryColor, borderColor: secondaryColor, text: order.orderType ?? 'InTransit'),

                ],
              ),
            ],
          ),
        )).onTap((){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OrderDetailsScreen(id: order.orderId!)));
    });
  }
}
