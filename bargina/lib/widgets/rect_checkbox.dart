import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/BaseViewModel.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
class RectChecBox extends StatelessWidget {
  const RectChecBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<BaseViewModel>(
      builder: (_, vm, child){
        return Container(
            width: 13.w,
            height: 13.h,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: whiteColor,
                border: Border.all(color: Colors.grey, width: 1.w)
            ),
            child: Center(
              child: Container(
                width: 9.w,
                height: 9.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: vm.check ? Colors.grey :whiteColor,
                ),
              ),
            )
        ).onTap((){
           vm.changeState();
        });
      },
    );

  }
}
