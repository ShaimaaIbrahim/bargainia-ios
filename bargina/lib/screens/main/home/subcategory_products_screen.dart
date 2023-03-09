import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/screens/main/home/widgets/product_list_item.dart';
import 'package:bargina/screens/main/home/widgets/product_sale_listitem.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Locator.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/texts.dart';
import '../BaseScreen.dart';
import 'package:shimmer/shimmer.dart';

class SubCategoryProductsScreen extends StatelessWidget {
  final id;
  final catId;
  const SubCategoryProductsScreen({Key? key, required this.id, required this.catId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeViewModel>(
      onModelReady: (_) {
        _.getSellCategoriesProducts(context, id);
      },
      builder: (_, vm, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: reg20Text('SELL ON BARGINIA', color: whiteColor),
            centerTitle: true,
            leading: Icon(
              Icons.arrow_back_ios_rounded,
              color: whiteColor,
              size: 20.w,
            ).onTap((){
              locator<NavigationService>().goBack();
            }),
          ),
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 30.h, right: 20.w, left: 20.w),
                child: Column(
                  children: [
                    heightSpace(20.h),
                    vm.subcategoryProducts == null
                        ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return _productSaleShimmer();
                      },
                      itemCount: 10,
                    )
                        : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return ProductSaleListItem(product: vm.subcategoryProducts![i], catId: catId,);
                      },
                      itemCount: vm.subcategoryProducts!.length
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    }
  _productSaleShimmer(){
    return Shimmer.fromColors(
      baseColor: greyColor,
      highlightColor: greyColor.withOpacity(0.1),
      direction: ShimmerDirection.ltr,
      child: Container(
          margin: EdgeInsets.only(bottom: 20.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              border: Border.all(color: Colors.grey, width: 1.w)
          ),
          child: Stack(
            children: [
              Padding(
                padding:
                EdgeInsets.only(left: 13.w, right: 13.w, top: 10.h, bottom: 13.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 60.w,
                          height: 72.h,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                              BorderRadius.all(Radius.circular(5.r)),
                              border:
                              Border.all(color: Colors.black12, width: 1.w)),
                        ),
                        widthSpace(16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100.w,
                              height: 16.h,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                                  border:
                                  Border.all(color: Colors.black12, width: 1.w)),
                            ),
                            heightSpace(5.h),
                            Container(
                              width: 100.w,
                              height: 16.h,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),),
                            ),
                            heightSpace(5.h),
                            Container(
                              width: 100.w,
                              height: 16.h,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                                  border:
                                  Border.all(color: Colors.black12, width: 1.w)),
                            ),

                          ],
                        )
                      ],
                    ),
                    heightSpace(5.h),
                    Row(
                      children: [
                        Container(
                          width: 100.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
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
                              color: Colors.grey[200],
                              borderRadius:
                              BorderRadius.all(Radius.circular(5.r)),
                              border:
                              Border.all(color: Colors.black12, width: 1.w)),
                        ),
                      ],
                    ),
                    heightSpace(5.h),
                    Row(
                      children: [
                        Container(
                          width: 100.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
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
                              color: Colors.grey[200],
                              borderRadius:
                              BorderRadius.all(Radius.circular(5.r)),
                              border:
                              Border.all(color: Colors.black12, width: 1.w)),
                        ),
                      ],
                    ),
                    heightSpace(5.h),
                    Row(
                      children: [
                        Container(
                          width: 100.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                              BorderRadius.all(Radius.circular(5.r)),
                              border:
                              Border.all(color: Colors.black12, width: 1.w)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle
                    ),
                    child: Center(
                        child:  Icon(Icons.navigate_next, color: whiteColor,)
                    ),
                  )
              )
            ],
          )
      ),
    );
  }
  }
