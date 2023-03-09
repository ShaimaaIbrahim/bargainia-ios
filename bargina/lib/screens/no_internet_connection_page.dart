import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Locator.dart';
import '../services/navigation_service.dart';
import '../utils/common_functions.dart';
import '../utils/texts.dart';
class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      color: whiteColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/icons/no_internet.png', width: 50.w, height: 50.h,),
            heightSpace(10.h),
            bold20Text('Oops No Internet !'),
            heightSpace(10.h),
            SizedBox(
                width: 300.w,
                child: reg14Text('looks like you are facing a temporary network interrution  or check your connection', color: greyColor.withOpacity(0.5))),
            heightSpace(20.h),
            Image.asset('assets/icons/retry.png', width: 40.w, height: 40.h,)
          ],
        )
      ),
    );
  }
}
