import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipListItem extends StatelessWidget {
  final text;
   ChipListItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.w)),
          color: Colors.grey[300]
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
        child: bold16Text(text, color: Colors.grey[800])
      ),
    );
  }
}
