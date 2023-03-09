import 'package:bargina/screens/main/home/widgets/category_shimmer_item.dart';
import 'package:bargina/screens/main/home/widgets/product_category_shimmer_item.dart';
import 'package:flutter/material.dart';
import 'package:bargina/screens/main/home/products_page.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/screens/main/home/widgets/category_list_item.dart';
import 'package:bargina/screens/main/home/widgets/slider_list_item.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/viewmodel/main_viewmodel.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerWidget extends StatelessWidget {
  const HomeShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 120.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return CategoryShimmerItem();
              },
              itemCount: 8,
            ),
          ),
          // heightSpace(30.h),
          // Padding(
          //   padding: EdgeInsets.only(left: 20.w, right: 20.w),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //
          //       Expanded(
          //           flex: 1,
          //           child: StyledButton(function: (){
          //             locator<NavigationService>().navigateTo(RouteName.SellonBargina);
          //           }, text: 'Sell on Bargainia', fillColor: secondaryColor,)),
          //       widthSpace(14.w),
          //       Expanded(
          //           flex: 1,
          //           child: StyledButton(function: (){
          //             locator<NavigationService>().navigateTo(RouteName.BuyNow);
          //           }, text: 'Buy Now', fillColor: primaryColor,)),
          //
          //     ],
          //   ),
          // ),
          heightSpace(24.h),
          for (int i = 0; i < 8; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: greyColor,
                  highlightColor: greyColor.withOpacity(0.1),
                  direction: ShimmerDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                            border:
                                Border.all(color: Colors.black12, width: 1.w)),
                      ),
                      Spacer(),
                      Container(
                        width: 100.w,
                        height: 14.h,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                            border:
                                Border.all(color: Colors.black12, width: 1.w)),
                      )
                    ],
                  ),
                ),
                heightSpace(5.h),
                Shimmer.fromColors(
                baseColor: greyColor,
                highlightColor: greyColor.withOpacity(0.1),
                direction: ShimmerDirection.ltr,
                  child: Container(
                    width: 100.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        border: Border.all(color: Colors.black12, width: 1.w)),
                  ),
                ),
                heightSpace(10.h),
                SizedBox(
                  height: 280.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ProductCategoryShimmerItem();
                      },
                      itemCount: 8),
                ),
              ],
            ),
          heightSpace(10.h),
          // StyledButton(
          //   function: () {},
          //   text: 'VIEW ALL PHONES',
          //   fillColor: primaryColor,
          //   width: 157.w,
          // ),
          heightSpace(20.h),
          SliderListItem(),
          heightSpace(30.h),
        ],
      ),
    );
  }
}
