import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/BaseViewModel.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class RoundChecBox extends StatelessWidget {

   bool check;
   Function function;
   RoundChecBox({Key? key, required this.check, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 17.w,
        height: 17.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: whiteColor,
            border: Border.all(color: Colors.grey, width: 1.w)),
        child: Center(
          child: Container(
            width: 9.w,
            height: 9.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: check==true ? Colors.grey : whiteColor,
            ),
          ),
        )).onTap((){
          function();
    });

  }
}
