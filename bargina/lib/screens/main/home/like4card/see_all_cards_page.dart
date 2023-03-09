import 'package:bargina/screens/main/home/like4card/like4card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/screens/main/home/widgets/filter_categoty_product.dart';
import 'package:bargina/screens/main/home/widgets/product_category_shimmer_item.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Locator.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/texts.dart';
import '../../../../widgets/cached_network_image.dart';

class SeeAllCardsPage extends StatelessWidget {
  final id;

  const SeeAllCardsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeViewModel>(
      onModelReady: (_) {
        _.getLike4CardsCategoriesProducts(context, id);
      },
      builder: (_, vm, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: bold16Text('LikeCards Products', color: whiteColor),
            centerTitle: true,
            leading: Icon(
              Icons.arrow_back_ios_rounded, color: whiteColor, size: 20.w,)
                .onTap(() {
              locator<NavigationService>().goBack();
            }),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.h, right: 10.w, left: 10.w),
                    child: Column(
                      children: [
                        heightSpace(21.h),
                        vm.like4CardCatProducts == null ? SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              //mainAxisSpacing: 5,
                              //crossAxisSpacing: 5,
                              childAspectRatio: MediaQuery
                                  .of(context)
                                  .size
                                  .width / (MediaQuery
                                  .of(context)
                                  .size
                                  .height / 1.4),
                            ),
                            itemBuilder: (context, i) {
                              return ProductCategoryShimmerItem();
                            },
                            itemCount: 10,
                          ),
                        ) : vm.like4CardCatProducts!.isEmpty ? Center(
                          child: bold16Text('no products'),
                        ) : SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: MediaQuery
                                  .of(context)
                                  .size
                                  .width / (MediaQuery
                                  .of(context)
                                  .size
                                  .height / 1.4),
                            ),
                            itemBuilder: (context, i) {
                              return _buildLike4cardProduct(vm.like4CardCatProducts![i], context);
                            },
                            itemCount: vm.like4CardCatProducts!.length,
                          ),
                        ),

                      ],
                    ),
                  ),
                  heightSpace(100.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  _buildLike4cardProduct(cardItem, BuildContext context){
    return  SizedBox(
     /// height: 280.h,
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
                        //width: 60.w,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(4.w),
                            child: bold14Text(cardItem.available == true? 'available' : 'not available', color: whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  heightSpace(10.h),
                  CachedNetworkmage(
                    url: cardItem.productImage,
                    height: 70.h,
                    width: 100.w,
                  )
                ],
              ),
            ),
          ),
         /// heightSpace(5.h),
          Expanded(
              child: bold14Text(cardItem.productName)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              bold16Text('${cardItem.sellPrice} SR'),
              widthSpace(10.w),
              bold16Text('${cardItem.totalPrice.toString().substring(0, 2)} SR', color: secondaryColor),
            ],
          ),
          //heightSpace(10.h)
        ],
      ),
    ).onTap((){
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Like4CardDetailsPage(cardItem: cardItem)));
    });
  }
}
