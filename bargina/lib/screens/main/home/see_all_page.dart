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
import '../../../Locator.dart';
import '../../../utils/colors.dart';
import '../../../utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/search_textfield.dart';
import '../category/widgets/product_category_item.dart';
class SeeAllPage extends StatelessWidget {
  final title;
  final catId;

  const SeeAllPage({Key? key, required this.title, required this.catId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeViewModel>(
      onModelReady: (_){
        _.getCategories(context);
        _.getProductsByCategoryId(context, catId);
      },
      builder: (_, vm, child){
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar:AppBar(
            backgroundColor: primaryColor,
            title: bold16Text(title, color: whiteColor),
            centerTitle: true,
            leading: Icon(Icons.arrow_back_ios_rounded, color: whiteColor, size: 30.w,).onTap((){
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
                        vm.categories==null ?  SizedBox(
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
                              //mainAxisSpacing: 5,
                              //crossAxisSpacing: 5,
                              childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/1.4),
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
