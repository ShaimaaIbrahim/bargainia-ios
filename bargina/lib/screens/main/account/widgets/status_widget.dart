import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class StatusWidget extends StatelessWidget {
  final Color fillColor;
  final Color borderColor;
  final String text;

   StatusWidget({Key? key, required this.fillColor, required this.borderColor, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 24.h,
      width: 63.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.w)),
          border: Border.all(width: 1.w, color: text == 'Pareparing' ? additionColor : borderColor),
          color: text == 'Shipped' ? primaryColor : text== 'In Transit' ? primaryColor : whiteColor

      ),
      child: Center(
        child: Padding(
            padding: EdgeInsets.all(3.w),
            child: med11Text(text, color: text == 'Pareparing' ? additionColor : whiteColor)),
      ),
    );
  }
}
