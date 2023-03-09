import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/category/widgets/sub_category_shimmer.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/screens/main/viewmodel/main_viewmodel.dart';
import 'package:bargina/screens/no_internet_connection_page.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/search_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../home/home_subcat_page.dart';
import '../home/products_page.dart';
import '../home/widgets/category_list_item.dart';
import '../home/widgets/category_shimmer_item.dart';

class CategoryScreen extends StatelessWidget {
  final MainViewModel viewModel;
  const CategoryScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeViewModel>(
      onModelReady: (_) {
        viewModel.getSellCategories(context);
        retryConnection((){
          viewModel.getSellCategories(context);
        });
      },
      builder: (_, vm, child) {
        return vm.state ==ViewState.NOINTERNET ?  NoInternetPage() :Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 50.h,
                  color: primaryColor,
                ),
                heightSpace(22.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      heightSpace(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child:  viewModel.products == null ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, i) {
                                return CategoryShimmerItem();
                              },
                              itemCount: 8,
                            )
                                : ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: CategoriListItem(
                                    category: viewModel.products![i],
                                  ).onTap(() {
                                    viewModel.setSelectedCategory(context, viewModel.products![i].id, i);
                                  }),
                                );
                              },
                              itemCount: viewModel.products!.length,
                            ),
                          ),
                          widthSpace(10.w),
                          Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  viewModel.selectedCategory == null ? SizedBox():med16Text(viewModel.selectedCategory.title ?? '', color: HexColor('#00173F')),
                                  heightSpace(10.h),
                                 viewModel.sellsubcat==null ? SubCategoryShimmer(): Container(
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
                                          return _subCategoryItem(viewModel.sellsubcat![i], context);
                                        },
                                        itemCount: viewModel.sellsubcat!.length,
                                      ),
                                    )
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                      heightSpace(40.h),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 20.h,
              left: 20.w,
              right: 20.w,
              child: SearchTextField(
                color: backgroundColor,
                width: MediaQuery.of(context).size.width,
              ),
            )
          ],
        );
      },
    );
  }

  _subCategoryItem(category, BuildContext context){
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Row(
        children: [
          med16Text(category.name, color: HexColor('#515C6F')),
          Spacer(),
         Container(
           width: 18.w,
           height: 18.h,
           decoration: BoxDecoration(
             color: HexColor('#727C8E').withOpacity(0.20),
             shape: BoxShape.circle,
           ),
           child: Center(
             child: Icon(Icons.arrow_forward_ios, color: HexColor('#727C8E'), size: 10.w,),
           ),
         ).onTap((){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
               HomeSubCateProductsPage(id: category.id, title: category.slug,)));
         })
        ],
      ),
    );
  }
}
