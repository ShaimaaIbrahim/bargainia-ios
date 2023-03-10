import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

Widget headerText(String header) {
  return Text(
    header,
    style:
    TextStyle(fontSize: 24, color: blackColor, fontWeight: FontWeight.bold),
  );
}

Widget stateText(String header, {Color? color}) {
  return Text(
    header,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 22,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget normal18Text(String header, {Color? color}) {
  return Text(
    header,
    maxLines: 2,
    style: TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: 18,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget reegular34Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
      fontSize: 34.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget reegular20Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
      fontSize: 20.sp,
      color: color == null ? blackColor : color,
    ),
  );
}


Widget bold18Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.sp,
      color: color == null ? blackColor : color,
    ),
  );
}


Widget med18Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget reg18Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget med14Text(String header, {Color? color, bool? align}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      color: color == null ? blackColor : color,
    ),
  );
}



Widget bold16Text(String header, {Color? color, bool? align}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16.sp,
      color: color == null ? blackColor : color,
    ),
    maxLines: 200,
    overflow: TextOverflow.ellipsis,
    textAlign: align==true ? TextAlign.center: null,
  );
}

Widget med16Text(String header, {Color? color, bool? align}){
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget reg16Text(String header, {Color? color, bool? align}){
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget bold22Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22.sp,
      color: color == null ? blackColor : color,
    ),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}

Widget bold20Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
      color: color == null ? blackColor : color,
    ),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}

Widget normal20Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 20.sp,
      color: color == null ? blackColor : color,
    ),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}

Widget bold28Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28.sp,
      color: color == null ? blackColor : color,
    ),
  );
}
Widget bold25Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget bold21Text(String header, {Color? color, TextAlign? textAlign, int? maxlines}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 21.sp,
      color: color == null ? blackColor : color,
    ),
    textAlign: textAlign ?? TextAlign.justify,
    maxLines: maxlines ?? 1,
  );
}

Widget reg20Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 20.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget bold24Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 21.sp,
      color: color == null ? blackColor : color,
    ),
  );
}
Widget bold35Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 35.sp,
      color: color == null ? blackColor : color,
    ),
  );
}
Widget bold30Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget normal14Text(String header, {Color? color}){
  return Text(
    header,
    textAlign: TextAlign.start,
    style: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget reg12withLineText(String header, {Color? color}){
  return Text(
    header,
    maxLines: 2,
    // textAlign: TextAlign.center,
    style: TextStyle(
      decoration: TextDecoration.lineThrough,
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget normal16Text(String header, {Color? color}){
  return Text(
    header,
    maxLines: 2,
   // textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,

      color: color == null ? blackColor : color,
    ),
  );
}
Widget normal30Text(String header, {Color? color}) {
  return Text(
    header,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 30.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget reg12Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget med20Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget med11Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget bold11Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 11.sp,
      color: color == null ? blackColor : color,
    ),
  );
}
Widget semiBold14Text(String header,  {Color? color}){
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget bold12LineText(String header,  {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12.sp,
      decorationStyle: TextDecorationStyle.solid,
      decoration:
      TextDecoration.lineThrough,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget light14Text(String header,  {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget bold14LineText(String header,  {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
      decorationStyle: TextDecorationStyle.solid,
      decoration:
      TextDecoration.lineThrough,
      color: color == null ? blackColor : color,
    ),
  );
}
Widget bold12Text(String header, {Color? color}) {
  return Text(
    header,
    maxLines: 1,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget normal12Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget bold9Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 9.sp,
      color: color == null ? blackColor : color,
    ),
  );
}

Widget bold7Text(String header, {Color? color}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 7.sp,
      color: color == null ? blackColor : color,
    ),
  );
}




Widget bold14Text(String header, {Color? color}) {
  return Text(
    header,
    textAlign: TextAlign.center,
    maxLines: 200,
    style: TextStyle(
        fontSize: 14.sp,
        color: color == null ? blackColor : color,
        fontWeight: FontWeight.bold),
  );
}

Widget reg14Text(String header, {Color? color, TextAlign? align}) {
  return Text(
    header,
    maxLines: 200,
    textAlign: align,
    style: TextStyle(
        fontSize: 14.sp,
        color: color == null ? blackColor : color,
        fontWeight: FontWeight.w400),
  );
}

Widget med26Text(String header, {Color? color}){
  return Text(
    header,
    maxLines: 200,
    style: TextStyle(
        fontSize: 26.sp,
        color: color == null ? blackColor : color,
        fontWeight: FontWeight.w500),
  );
}

Widget buttonText(String header) {
  return Text(
    header,
    style: TextStyle(
      fontSize: 14.sp,
      color: Colors.white,
    ),
  );
}