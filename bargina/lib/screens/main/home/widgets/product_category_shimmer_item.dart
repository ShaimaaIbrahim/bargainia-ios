import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/texts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProductCategoryShimmerItem extends StatelessWidget {
  const ProductCategoryShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: greyColor,
      highlightColor: greyColor.withOpacity(0.1),
      direction: ShimmerDirection.ltr,
      child: SizedBox(
        height: 280.h,
        width: 170.w,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10.w ,),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(5.w)),
                  border: Border.all(width: 1.w, color: Colors.grey)),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(20.w)),
                          ),
                          width: 60.w,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(4.w),
                              child: bold14Text('New', color: whiteColor),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: whiteColor, shape: BoxShape.circle),
                         ),
                      ],
                    ),
                    heightSpace(10.h),
                    Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black12, width: 1.w)
                      ),
                    )
                  ],
                ),
              ),
            ),
            heightSpace(5.h),
            Container(
              width: 100.w,
              height: 16.h,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  border: Border.all(color: Colors.black12, width: 1.w)
              ),
            ),
            heightSpace(5.h),
            Container(
              width: 100.w,
              height: 16.h,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  border: Border.all(color: Colors.black12, width: 1.w)
              ),
            ),
            heightSpace(5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      border: Border.all(color: Colors.black12, width: 1.w)
                  ),
                ),
                widthSpace(5.w),
                Container(
                  width: 60.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      border: Border.all(color: Colors.black12, width: 1.w)
                  ),
                )
              ],
            ),
            //heightSpace(10.h)
          ],
        ),
      ),
    );
  }
}
