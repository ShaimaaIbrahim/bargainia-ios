import 'dart:ui';

import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/texts.dart';
class StatusIconWidget extends StatelessWidget {
  final String text;

  StatusIconWidget({Key? key,
    required this.text, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      width: 87.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.w)),
          border: Border.all(width: 1.w, color: primaryColor),
          color: whiteColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.local_shipping_outlined, color: secondaryColor, size: 12.w,),
          widthSpace(5.w),
          bold11Text(text, color: secondaryColor)
        ],
      ),
    );
  }
}