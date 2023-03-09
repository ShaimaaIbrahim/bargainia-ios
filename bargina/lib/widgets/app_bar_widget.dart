import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarWidget extends StatelessWidget {
  final String text;
   AppBarWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: bold16Text(text, color: whiteColor),
      centerTitle: true,
      leading: Icon(Icons.filter_list, color: whiteColor, size: 30.w,),
      actions: [
        Icon(Icons.filter_list, color: whiteColor, size: 30.w,)
      ],
    );
  }
}
