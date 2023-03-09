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
import '../../../Locator.dart';
import '../../../utils/colors.dart';
import '../../../utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/search_textfield.dart';
import '../category/widgets/product_category_item.dart';


class BuyNowScreen extends StatelessWidget {
  const BuyNowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BaseScreen<HomeViewModel>(
      onModelReady: (_){
        _.getCategories(context);
        _.getAllCities(context);
        _.getProductsByCityId(context, '78');
      },
      builder: (_, vm, child){
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar:AppBar(
            backgroundColor: primaryColor,
            title: reg20Text('Buy Now', color: whiteColor),
            centerTitle: true,
            leading: Icon(Icons.arrow_back_ios_rounded, color: whiteColor, size: 20.w,).onTap((){
              locator<NavigationService>().goBack();
            }),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, right: 10.w, left: 10.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Expanded(
                                flex: 1,
                                child: Icon(Icons.arrow_back_ios_outlined, color: secondaryColor, size: 18.w,)),
                            //widthSpace(10.w),
                            Expanded(
                                flex: 7,
                                child: SearchTextField(color: greyColor, width: 230.w,)),
                          //  widthSpace(10.w),
                            Expanded(
                              flex: 1,
                              child: Image.asset('assets/icons/filter.png', width: 18.w, height: 18.h,).onTap((){
                                vm.setVisible();
                              }),
                            ),
                          ],
                        ),
                        heightSpace(21.h),
                       vm.cities==null ?  Shimmer.fromColors(
                         baseColor: greyColor,
                         highlightColor: greyColor.withOpacity(0.1),
                         direction: ShimmerDirection.ltr,
                         child: SizedBox(
                           height: 50.h,
                           child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                             physics: const BouncingScrollPhysics(),
                             itemBuilder: (context, i) {
                               return Container(
                                 width: 100.w,
                                 height: 18.h,
                                 margin: EdgeInsets.only(left: 5.w, right: 5.w),
                                 decoration: BoxDecoration(
                                     color: Colors.grey,
                                     borderRadius:
                                     BorderRadius.all(Radius.circular(5.r)),
                                     border: Border.all(
                                         color: Colors.black12, width: 1.w)),
                               );
                             },
                             itemCount: 10,
                           ),
                         ),
                       ):  SizedBox(
                         height: 50.h,
                         child: ListView.builder(
                           scrollDirection: Axis.horizontal,
                           physics: const BouncingScrollPhysics(),
                           itemBuilder: (context, i) {
                             return Padding(
                                 padding: EdgeInsets.only(right: 15.w),
                                 child: bold18Text(vm.cities![i].name, color: i==vm.selectedIndex ? blackColor: Colors.grey[400] )).onTap((){
                               vm.setClick(i, context);
                             });
                           },
                           itemCount: vm.cities!.length,
                         ),
                       ),
                        heightSpace(21.h),
                       vm.categories==null || vm.products==null  ?  SizedBox(
                         height: MediaQuery.of(context).size.height,
                         child: GridView.builder(
                           shrinkWrap: true,
                           physics:  BouncingScrollPhysics(),
                           gridDelegate:
                           SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2,
                             //mainAxisSpacing: 5,
                             //crossAxisSpacing: 5,
                             childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/1.4),
                           ),
                           itemBuilder: (context, i) {
                             return ProductCategoryShimmerItem();
                           },
                           itemCount: 10,
                         ),
                       ): SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics:  BouncingScrollPhysics(),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 60,
                              crossAxisSpacing: 5,
                              //  childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/1.4),
                            ),
                            itemBuilder: (context, i) {
                              return ProductCategoryListItem(
                                product: vm.products![i]
                              );
                            },
                            itemCount: vm.products!.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0.w,
                    top: 0.h,
                    right: 100.w,
                    child: FilterCategoryProducts(
                      viewModel: vm,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

  }
}
