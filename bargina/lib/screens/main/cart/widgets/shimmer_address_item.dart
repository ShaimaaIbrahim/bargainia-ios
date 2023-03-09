import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerAddressItem extends StatelessWidget {
  const ShimmerAddressItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
      child:   ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics:  BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          return  _addressListItem();
        },
        itemCount: 5
      ),

    );
  }
  _addressListItem(){
    return Shimmer.fromColors(
      baseColor: greyColor,
      highlightColor: greyColor.withOpacity(0.1),
      direction: ShimmerDirection.ltr,
      child: Container(
        color: whiteColor,
        margin: EdgeInsets.only(bottom: 30.h),
        child: Column(
          children: [
            Row(
              children: [
                bold18Text('Home Address'),
              ],
            ),
            heightSpace(20.h),
            Row(
              children: [
                Container(
                  width: 280.w,
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(5.w)),
                      border: Border.all(width: 1.w, color: Colors.grey)),
                ),
                // Spacer(),
                // Container(
                //   width: 24.w,
                //   height: 24.h,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     border: Border.all(color: secondaryColor, width: 1.w),
                //     color: Colors.grey
                //   ),
                //   child: Center(
                //       child: Icon(Icons.done, color: whiteColor, size: 13.w,)
                //   ),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
