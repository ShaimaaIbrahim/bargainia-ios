import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/screens/main/home/widgets/product_category_shimmer_item.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/texts.dart';
import '../category/widgets/product_category_item.dart';
class HomeSubCateProductsPage extends StatelessWidget {
  dynamic id;
  dynamic title;
  HomeSubCateProductsPage({Key? key, this.id, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeViewModel>(
      onModelReady: (_){
        _.getSubCatProductsByCategoryId(context, id);
      },
      builder: (_, vm, child){
        return Scaffold(
          appBar:AppBar(
            backgroundColor: primaryColor,
            title: reg20Text('$title Products', color: whiteColor),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  children: [
                    heightSpace(20.h),
                    vm.products==null ? Container(
                      // width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics:  const BouncingScrollPhysics(),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/1.4),
                        ),
                        itemBuilder: (context, i) {
                          return ProductCategoryShimmerItem();
                        },
                        itemCount: 10,
                      ),
                    ) :  vm.products!.isEmpty ? Center(
                      child: normal16Text('No Products'),
                    ) : Container(
                      // width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics:  const BouncingScrollPhysics(),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
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
                    heightSpace(50.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}