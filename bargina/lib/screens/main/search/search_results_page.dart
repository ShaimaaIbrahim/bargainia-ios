// import 'package:bargina/screens/main/cart/widgets/shimmer_address_item.dart';
// import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
// import 'package:bargina/screens/main/search/widget/search_item_list.dart';
// import 'package:bargina/services/navigation_service.dart';
// import 'package:bargina/utils/colors.dart';
// import 'package:bargina/utils/common_functions.dart';
// import 'package:bargina/utils/extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../Locator.dart';
// import '../../../utils/texts.dart';
// import '../BaseScreen.dart';
// class SearchResultsPage extends StatelessWidget {
//    final catId;
//    final price;
//    final date;
//    SearchResultsPage({Key? key, required this.catId, required this.price, required this.date }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseScreen<HomeViewModel>(
//       onModelReady: (_){
//         _.applyFilters(context, catId, price, date);
//       },
//        builder: (_, vm, child){
//          return Scaffold(
//            appBar:AppBar(
//              backgroundColor: primaryColor,
//              elevation: 0.0,
//              title: bold16Text('Filter Results', color: whiteColor),
//              centerTitle: true,
//
//              leading: Icon(Icons.arrow_back_ios_rounded, color: whiteColor, size: 30.w,).onTap((){
//                locator<NavigationService>().goBack();
//              }),
//            ),
//            backgroundColor: backgroundColor,
//            body: SafeArea(
//              child: SingleChildScrollView(
//                child: Padding(
//                  padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: [
//                          normal16Text('RESULTS', color: textColor),
//                          Spacer(),
//                          normal12Text('${vm.filters!.length} results found', color: Colors.grey),
//                        ],
//                      ),
//                      heightSpace(20.h),
//                     vm.filters==null ? ShimmerAddressItem()  : ListView.builder(
//                        shrinkWrap: true,
//                        scrollDirection: Axis.vertical,
//                        physics: const BouncingScrollPhysics(),
//                        itemBuilder: (context, i) {
//                          return SearchItemList(
//                              product : vm.filters![i]
//                          );
//                        },
//                        itemCount: vm.filters!.length,
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//          );
//        },
//     );
//
//   }
// }
