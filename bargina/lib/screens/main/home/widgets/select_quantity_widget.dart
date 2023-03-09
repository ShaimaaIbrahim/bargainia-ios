import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SelectQuanWidget extends StatelessWidget {
  const SelectQuanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(5.w))
      ),
    );
  }
}
