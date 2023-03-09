import 'package:bargina/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/colors.dart';
class InfoShimmerWidget extends StatelessWidget {
  const InfoShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
        baseColor: greyColor,
        highlightColor: greyColor.withOpacity(0.1),
        direction: ShimmerDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.w,
            height: 20.h,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                border: Border.all(color: Colors.black12, width: 1.w)
            ),
          ),
          heightSpace(5.h),
          Container(
            width: 100.w,
            height: 14.h,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                border: Border.all(color: Colors.black12, width: 1.w)
            ),
          )
        ],
      ),
    );
  }
}
