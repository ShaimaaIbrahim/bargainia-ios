import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/common_functions.dart';

class CategoryShimmerItem extends StatelessWidget {
   CategoryShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: greyColor,
      highlightColor: greyColor.withOpacity(0.1),
      direction: ShimmerDirection.ltr,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor
                ),
                child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child:   Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle
                      ),
                    ))) ,
            heightSpace(10.h),
            Container(
              width: 100.w,
              height: 16.h,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  border: Border.all(color: Colors.black12, width: 1.w)
              ),
            )
          ],
        ),
      ),
    );
  }
}
