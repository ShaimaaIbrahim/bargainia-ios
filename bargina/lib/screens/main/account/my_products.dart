import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/screens/main/account/widgets/my_product_list_item.dart';
import 'package:bargina/screens/no_internet_connection_page.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Locator.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/texts.dart';
import '../cart/widgets/shimmer_address_item.dart';
import '../home/widgets/product_list_item.dart';

class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AccountViewModel>(
      onModelReady: (_){
        _.getMyProducts(context);
        retryConnection((){
          _.getMyProducts(context);
        });
      },
      afterModelReady: (_){
       // _.getMyProducts(context);
      },
      builder: (_, vm, child){
        return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: bold16Text('My Products', color: whiteColor),
              centerTitle: true,
              leading: Icon(
                Icons.arrow_back_ios_outlined,
                color: whiteColor,
                size: 20.w,
              ).onTap((){
                locator<NavigationService>().goBack();
              }),
            ),
            body: SafeArea(
                child: SingleChildScrollView(
                    child:
                    Padding(padding: EdgeInsets.all(10.w),
                        child: Column(
                          children: [
                            heightSpace(10.h),
                         vm.state==ViewState.NOINTERNET ? NoInternetPage():
                         vm.products==null || vm.state==ViewState.Busy ? ShimmerAddressItem() :
                           vm.products!.isEmpty ?
                               SizedBox(
                                 height: MediaQuery.of(context).size.height-100.h,
                                 width: MediaQuery.of(context).size.width,
                                 child: Center(
                                   child: bold16Text('no products'),
                                 ),
                               ) : ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, i) {
                                return MyProductListItem(
                                  product : vm.products![i], viewModel: vm,
                                );
                              },
                              itemCount: vm.products!.length ,
                            ),
                            heightSpace(50.h),
                          ],
                        )))));
      },
    );

  }
}
