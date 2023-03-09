import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/screens/main/home/widgets/container_image.dart';
import 'package:bargina/screens/main/home/widgets/customer_widget.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:page_indicator/page_indicator.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/texts.dart';
import '../../../../widgets/custome_number_picker.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20.w, left: 20.w),
          child: SizedBox(
              height: 250.h,
              child: PageIndicatorContainer(
                key: key,
                child: PageView(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Shimmer.fromColors(
                            baseColor: greyColor,
                            highlightColor: greyColor.withOpacity(0.1),
                            direction: ShimmerDirection.ltr,
                            child: Container(
                              width: 250.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.r)),
                                  border: Border.all(
                                      color: Colors.black12, width: 1.w)),
                            ),
                          )),
                  ],
                  controller: controller,
                  reverse: true,
                ),
                align: IndicatorAlign.bottom,
                length: 5,
                indicatorSpace: 10.0,
              )),
        ),
        heightSpace(34.h),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.w)),
              color: whiteColor),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 24.w, top: 39.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: greyColor,
                  highlightColor: greyColor.withOpacity(0.1),
                  direction: ShimmerDirection.ltr,
                  child: Row(
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
                        height: 18.h,
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
                heightSpace(21.h),
                Shimmer.fromColors(
                  baseColor: greyColor,
                  highlightColor: greyColor.withOpacity(0.1),
                  direction: ShimmerDirection.ltr,
                  child: Container(
                    width: 100.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        border: Border.all(color: Colors.black12, width: 1.w)),
                  ),
                ),
                heightSpace(18.h),
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
                heightSpace(21.h),
                Shimmer.fromColors(
                  baseColor: greyColor,
                  highlightColor: greyColor.withOpacity(0.1),
                  direction: ShimmerDirection.ltr,
                  child: Container(
                    width: 100.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        border: Border.all(color: Colors.black12, width: 1.w)),
                  ),
                ),
                heightSpace(12.h),
                Divider(
                  height: 1.h,
                  color: HexColor('#727C8E'),
                ),
                heightSpace(12.h),
                Shimmer.fromColors(
                  baseColor: greyColor,
                  highlightColor: greyColor.withOpacity(0.1),
                  direction: ShimmerDirection.ltr,
                  child: Container(
                    width: 100.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        border: Border.all(color: Colors.black12, width: 1.w)),
                  ),
                ),
                heightSpace(12.h),
                Divider(
                  height: 1.h,
                  color: HexColor('#727C8E'),
                ),
                heightSpace(47.h),
                Shimmer.fromColors(
                  baseColor: greyColor,
                  highlightColor: greyColor.withOpacity(0.1),
                  direction: ShimmerDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      normal14Text('Avaliable amount: 1',
                          color: Colors.grey[500]),
                      Spacer(),
                      Container(
                        width: 100.w,
                        height: 50.h,
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
                heightSpace(35.h),
                Shimmer.fromColors(
                  baseColor: greyColor,
                  highlightColor: greyColor.withOpacity(0.1),
                  direction: ShimmerDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // StyledButton(
                      //   function: () {},
                      //   fillColor: primaryColor,
                      //   text: 'ADD TO CART',
                      //   width: 140.w,
                      // ),
                      // widthSpace(15.w),
                      // StyledButton(
                      //   function: () {},
                      //   fillColor: secondaryColor,
                      //   text: 'PAY',
                      //   width: 140.w,
                      // ),
                    ],
                  ),
                ),
                heightSpace(35.h),
                Divider(
                  height: 1.h,
                  color: HexColor('#727C8E'),
                ),
                heightSpace(17.h),
                // ListView.builder(
                //   shrinkWrap: true,
                //   scrollDirection: Axis.vertical,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemBuilder: (context, i) {
                //     return CustomerInfoWidget(
                //         rate: vm.productDetails!.rates![i]);
                //   },
                //   itemCount: vm.productDetails!.rates!.length,
                // ),
                heightSpace(16.h),
                Shimmer.fromColors(
                  baseColor: greyColor,
                  highlightColor: greyColor.withOpacity(0.1),
                  direction: ShimmerDirection.ltr,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: ContainedImageWidget(
                            text: 'Trusted',
                            image: 'assets/icons/Trusted.png',
                          )),
                      widthSpace(8.w),
                      Expanded(
                          flex: 1,
                          child: ContainedImageWidget(
                              text: 'Approved',
                              image: 'assets/icons/Approved.png')),
                      widthSpace(8.w),
                      Expanded(
                          flex: 1,
                          child: ContainedImageWidget(
                              text: 'Featured',
                              image: 'assets/icons/Featured.png'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
