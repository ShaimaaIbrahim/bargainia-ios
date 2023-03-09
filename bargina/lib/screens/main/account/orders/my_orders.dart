import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/screens/main/account/widgets/order_list_item.dart';
import 'package:bargina/screens/no_internet_connection_page.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:bargina/screens/main/account/widgets/my_product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Locator.dart';
import '../../../../services/navigation_service.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/texts.dart';
import '../../cart/widgets/shimmer_address_item.dart';
import '../../home/widgets/product_list_item.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AccountViewModel>(
      onModelReady: (_){
       _.getMyOrders(context);
         retryConnection((){
         _.getMyOrders(context);
       });
      },
      builder: (_, vm, child){
        return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: reg20Text('My Orders', color: whiteColor),
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
                    Padding(padding: EdgeInsets.all(16.w),
                        child: Column(
                          children: [
                            heightSpace(10.h),
                          vm.state ==ViewState.NOINTERNET ? NoInternetPage()
                              :vm.orders==null || vm.state==ViewState.Busy ? ShimmerAddressItem()
                              : vm.orders!.isEmpty ?    SizedBox(
                            height: MediaQuery.of(context).size.height-100.h,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: bold16Text('no orders'),
                            ),
                          ):ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, i) {
                                return OrderListItem(
                                  order: vm.orders![i]
                                );
                              },
                              itemCount: vm.orders!.length,
                             // itemCount: vm.orders.length,
                            ),
                            heightSpace(20.h),
                          ],
                        )))));
      },
    );

  }
}
