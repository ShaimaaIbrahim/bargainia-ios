import 'package:bargina/screens/main/home/products_page.dart';
import 'package:bargina/screens/main/home/see_all_page.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/screens/main/home/widgets/category_list_item.dart';
import 'package:bargina/screens/main/home/widgets/home_shimmer_widget.dart';
import 'package:bargina/screens/main/home/widgets/product_home_list_item.dart';
import 'package:bargina/screens/main/home/widgets/slider_list_item.dart';
import 'package:bargina/screens/no_internet_connection_page.dart';
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
import 'package:hexcolor/hexcolor.dart';
import '../../../Locator.dart';
import '../../../enums/ScreenState.dart';
import '../category/widgets/product_category_item.dart';
import '../search/widget/like4card_list_item.dart';
import 'like4card/like4card_page.dart';
import 'like4card/see_all_cards_page.dart';

class HomeScreen extends StatelessWidget {
    MainViewModel viewModel;
    HomeScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeViewModel>(
      onModelReady: (_){

        viewModel.getCategories(context);
        viewModel.getLike4CardsCategories(context);

         retryConnection((){
           viewModel.getCategories(context);
           viewModel.getLike4CardsCategories(context);
         });
      },
      builder: (_, vm, child){
        return viewModel.state == ViewState.NOINTERNET ? NoInternetPage() : viewModel.categories==null || viewModel.like4CardCategories ==null || viewModel.state==ViewState.Busy ? HomeShimmerWidget() :Container(
          decoration: BoxDecoration(
            color: HexColor('#FFFFFF')
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
               viewModel.categories!.isNotEmpty? SizedBox(
                  height: 170.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.only(top: 16.h, right: 16.w),
                        child: CategoriListItem(
                          category: viewModel.categories![i],
                        ).onTap((){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                              ProductsPage(id: viewModel.categories![i].id, title: viewModel.categories![i].title,)));
                        }),
                      );
                    },
                    itemCount: viewModel.categories!.length,
                  ),
                ): Container(),
                heightSpace(30.h),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h, right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: StyledButton(function: (){
                            locator<NavigationService>().navigateTo(RouteName.BuyNow);
                          }, fillColor: primaryDarkColor,
                              radius: true,child: semiBold14Text('Buy Now', color: whiteColor))),
                      widthSpace(14.w),
                      Expanded(
                          flex: 1,
                          child: StyledButton(function: (){
                            locator<NavigationService>().navigateTo(RouteName.SellonBargina);
                          }, fillColor: secondaryColor, radius: true, child: semiBold14Text('Sell on Bargainia', color: whiteColor),)),

                    ],
                  ),
                ),
                viewModel.like4CardCategories ==null || viewModel.like4CardCategories!.isEmpty ? const SizedBox() :  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bold16Text('LikeCards', color: textColor),
                        reg14Text('Category Products', color: HexColor('#77838F')),
                      ],
                    ),
                  ],
                ),
                heightSpace(20.h),
                viewModel.like4CardCategories ==null || viewModel.like4CardCategories!.isEmpty ? const SizedBox() :SizedBox(
                  height: 140.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return Like4ListItem(
                        category: viewModel.like4CardCategories![i],
                      );
                    },
                    itemCount: viewModel.like4CardCategories!.length,
                  ),
                ),
                heightSpace(24.h),
                for(int i=0; i< viewModel.categories!.length ; i++)
                  viewModel.categories![i].products!=null && viewModel.categories![i].products!.isNotEmpty? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        reg14Text(viewModel.categories![i].title ?? ''),
                        // Spacer(),
                        // bold14Text('see all').onTap((){
                        //   Navigator.of(context).push(MaterialPageRoute(builder: (_)=> SeeAllPage(title: vm.categories![i].title, catId: vm.categories![i].id)));
                        // })
                      ],
                    ),
                    heightSpace(5.h),
                    normal12Text('Latest on ${viewModel.categories![i].title}', color: textColor.withOpacity(0.4)),
                    heightSpace(10.h),
                    viewModel.categories![i].products!=null && viewModel.categories![i].products!.isNotEmpty? SizedBox(
                      height: 270.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics:  BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ProductHomeListItem(
                            product : viewModel.categories![i].products[index],
                          );
                        },
                        itemCount: viewModel.categories![i].products.length,
                      ),
                    ): Container(height: 0.h,),
                    StyledButton(
                        width: 157.w,
                        fillColor: primaryColor,
                        radius: true,
                        function: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                              ProductsPage(id: viewModel.categories![i].id, title: viewModel.categories![i].title,)));
                        },
                        child: semiBold14Text('View All ${viewModel.categories![i].title}', color: whiteColor)),
                    heightSpace(31.h),
                    Image.asset('assets/images/banner.png', height: 110.h, width: 335.w),
                    heightSpace(20.h),

                  ],
                ): SizedBox(height:0.h),
                  heightSpace(10.h),

              ],
            ),
          ),
        );
      },
    );

  }
}





