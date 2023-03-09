import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/common_functions.dart';

class ItemShimmerWidget extends StatelessWidget {
  const ItemShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            border: Border.all(color: greyColor, width: 1.w)
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h, bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        border: Border.all(color: Colors.black12, width: 1.w)
                    ),
                  ),
                  widthSpace(15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(5.r)),
                            border: Border.all(color: Colors.black12, width: 1.w)
                        ),
                      ),
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
                ],
              ),
            ),
            Positioned(
              bottom: 10.h,
              left: 10.w,
              child: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    shape: BoxShape.circle
                ),
                child: Center(
                    child:  Icon(Icons.arrow_back_ios_outlined, color: whiteColor,)
                ),
              )
            )
          ],
        )
    );
  }
}
