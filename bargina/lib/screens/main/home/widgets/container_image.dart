import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class ContainedImageWidget extends StatelessWidget {
  final String text;
  final String image;
   ContainedImageWidget({Key? key, required this.text, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 107.w,
     // height: 44.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.w),
        borderRadius: BorderRadius.all(Radius.circular(5.w))
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 12.w, top: 14.h, bottom: 14.h, right: 12.w),
        child: Row(
          children: [
            Image.asset(image , color: secondaryColor,),
            widthSpace(4.w),
            reg12Text(text, color: HexColor('#1E2022')),
          ],
        ),
      ),
    );
  }
}
