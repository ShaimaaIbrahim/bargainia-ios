import 'package:bargina/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoadingScreen extends StatelessWidget {
  final Widget child;
  final bool loading;
  const LoadingScreen({Key? key, required this.child,this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          loading?Positioned.fill(
            child: Container(
              color: Colors.grey.withOpacity(0.3),
            ),
          ):const SizedBox(),
          loading?Positioned(
            child: Container(
             padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade400.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10.w),
              ),
              alignment: Alignment.center,
              child: Material(
                borderRadius: BorderRadius.circular(8.w),
                child: SizedBox(
                  width: 150.w,
                  height: 60.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("loading",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: blackColor
                      ),),
                      SizedBox(width: 8.w),
                      CupertinoActivityIndicator(
                          radius: 15.h, color: greyColor),
                    ],
                  ),
                ),
              ),
            ),
          ):const SizedBox(),
        ],
      ),
    );
  }
}
