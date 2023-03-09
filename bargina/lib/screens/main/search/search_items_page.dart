import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/cart/widgets/shimmer_address_item.dart';
import 'package:bargina/screens/main/home/product_details_page.dart';
import 'package:bargina/screens/main/search/model/search_product_model.dart';
import 'package:bargina/screens/main/search/viewmodel/search_viewmodel.dart';
import 'package:bargina/screens/main/search/widget/chip_listitem.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bargina/screens/main/search/widget/search_item_list.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Locator.dart';
import '../../../utils/texts.dart';
import '../../../widgets/search_textfield.dart';

class SearchItemsPage extends StatelessWidget {
  const SearchItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<SearchViewModel>(
      onModelReady: (_){
         _.getSearch();
      },
      builder: (_, vm , child){
        return Scaffold(
            appBar:AppBar(
              backgroundColor: primaryColor,
              elevation: 0.0,
              title: reg20Text('Search', color: whiteColor),
              centerTitle: true,
              leading: Icon(Icons.arrow_back_ios_rounded, color: whiteColor, size: 20.w,).onTap((){
                 locator<NavigationService>().goBack();
              }),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 29.h, right: 21.w, left: 21.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchTextField(width: MediaQuery.of(context).size.width,
                        color: greyColor, vm: vm, ),
                      // heightSpace(10.h),
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   scrollDirection: Axis.vertical,
                      //   physics: const BouncingScrollPhysics(),
                      //   itemBuilder: (context, i) {
                      //     return normal14Text('Samsung 12' , color: Colors.grey[500]);
                      //   },
                      //   itemCount: 3,
                      // ),
                      heightSpace(20.h),
                     vm.products==null ?  reg18Text('Recent Searches',): Container(),
                      heightSpace(10.h),
                     vm.searches.isNotEmpty && vm.products!.isEmpty ? Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12.0,
                        children: vm.chips
                      ): Container(),
                      heightSpace(10.h),
                     vm.products==null ? ShimmerAddressItem() : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, i) {
                          return SearchItemList(
                              product : vm.products![i]
                          );
                        },
                        itemCount: vm.products!.length,
                      ),
                    ],
                  ),
                ),
              ),
            )
        );
      },
    );

  }
}
