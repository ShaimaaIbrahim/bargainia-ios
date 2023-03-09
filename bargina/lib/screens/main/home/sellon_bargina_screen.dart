import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/screens/main/home/widgets/product_list_item.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/search_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Locator.dart';
import '../../../utils/texts.dart';
import 'package:shimmer/shimmer.dart';

class SellonBarginaScreen extends StatelessWidget {
  const SellonBarginaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeViewModel>(
      onModelReady: (_) {
        _.getSellCategories(context);
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
                    _buildSearchWidget(context),
                    heightSpace(20.h),
                    vm.products == null
                        ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, i) {
                              return _ProductShimmerListItem();
                            },
                            itemCount: 10,
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, i) {
                              return ProductListItem(product: vm.products![i]);
                            },
                            itemCount: vm.products!.length,
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

  _buildSearchWidget(BuildContext context) {
    return Container(
      //height: 80.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: secondaryColor),
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w, bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            reg14Text('Sell with Barginia. Does the Best', color: whiteColor),
            heightSpace(10.h),
            SearchTextField(
              color: whiteColor,
              width: MediaQuery.of(context).size.width,
            ),
            heightSpace(10.h),
            reg14Text('Low Fees. Fast Payment. Bargina Support',
                color: whiteColor),
          ],
        ),
      ),
    );
  }

  _ProductShimmerListItem() {
    return Shimmer.fromColors(
        baseColor: greyColor,
        highlightColor: greyColor.withOpacity(0.1),
        direction: ShimmerDirection.ltr,
      child: Container(
          margin: EdgeInsets.only(bottom: 20.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              border: Border.all(color: Colors.grey, width: 1.w)),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 20.h, bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          border: Border.all(color: Colors.black12, width: 1.w)),
                    ),
                    widthSpace(15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        heightSpace(10.h),
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
                  ],
                ),
              ),
              Positioned(
                bottom: 10.h,
                right: 10.w,
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: secondaryColor, shape: BoxShape.circle),
                ),
              )
            ],
          )),
    );
  }
}
