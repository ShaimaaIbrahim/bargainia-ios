
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';
import '../utils/texts.dart';

class StocialButton extends StatelessWidget {
  final text;
  final Color? fillColor;
  final Function function;
  final bool? radius;
  final String? image;
  const StocialButton({Key? key, this.text, required this.function, this.fillColor,
    this.radius, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.w),
        borderRadius: radius==null ? BorderRadius.all(Radius.circular(4.r)):  BorderRadius.all(Radius.circular(0.r)),
        color: fillColor?? primaryColor,),
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset(image!, width: 20.w, height: 20.h,),
              widthSpace(20.w),
             med14Text(text),


            ],
          ),
        ),
      )
    ).onTap(function);
  }
}