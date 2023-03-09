import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/texts.dart';
import 'package:shimmer/shimmer.dart';
class SubCategoryShimmer extends StatelessWidget {
  const SubCategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          boxShadow: [
            BoxShadow(
              color: HexColor('#2424240D'),
              blurRadius: 15,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return _subCategoryItem();
            },
            itemCount: 8,
          ),
        )
    );
  }
  _subCategoryItem(){
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Row(
        children: [
        Shimmer.fromColors(
        baseColor: greyColor,
        highlightColor: greyColor.withOpacity(0.1),
        direction: ShimmerDirection.ltr,
            child: Container(
              width: 150.w,
              height: 18.h,
              decoration: BoxDecoration(
                color: HexColor('#727C8E'),
               // shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.arrow_back_ios_rounded, color: HexColor('#727C8E'), size: 10.w,),
              ),
            ),
          ),
          Spacer(),
      Shimmer.fromColors(
        baseColor: greyColor,
        highlightColor: greyColor.withOpacity(0.1),
        direction: ShimmerDirection.ltr,
            child: Container(
              width: 18.w,
              height: 18.h,
              decoration: BoxDecoration(
                color: HexColor('#727C8E'),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.arrow_back_ios_rounded, color: HexColor('#727C8E'), size: 10.w,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
