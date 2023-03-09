import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/screens/main/home/widgets/product_list_item.dart';
import 'package:bargina/screens/main/home/widgets/product_sale_listitem.dart';
import 'package:bargina/screens/main/home/widgets/product_sell_list_item.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Locator.dart';
import '../../../utils/texts.dart';
import 'package:shimmer/shimmer.dart';

class ProductsForSellPage extends StatelessWidget {
  int id;
  dynamic name;
   ProductsForSellPage({Key? key, required this.id, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeViewModel>(
      onModelReady: (_){
        _.getSellSubCategories(context, id);
      },
      builder: (_, vm, child){
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
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reg18Text('$name For Sale', color: textColor),
                    heightSpace(15.h),
                    vm.sellsubcat==null ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return _ProductShimmerListItem();
                      },
                      itemCount: 10,
                    ) : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return ProductSellListItem(
                          catId : id,
                          product: vm.sellsubcat![i]
                        );
                      },
                      itemCount: vm.sellsubcat!.length,
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
