import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/screens/main/account/widgets/address_list_item.dart';
import 'package:bargina/screens/main/cart/widgets/shimmer_address_item.dart';
import 'package:bargina/screens/no_internet_connection_page.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/styled_button.dart';

import '../../../Locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/texts.dart';
import 'my_account_screen.dart';
import 'package:flutter/material.dart';
import 'my_account_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'new_shipping_address.dart';

class ShippinAddressScreen extends StatelessWidget {
  const ShippinAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AccountViewModel>(
      onModelReady: (_) {
        _.getMyAddresses(context);
        retryConnection(() {
          _.getMyAddresses(context);
        });
      },
      builder: (_, vm, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: reg20Text('Shipping Addresses', color: whiteColor),
            centerTitle: true,
            leading: Icon(
              Icons.arrow_back_ios_outlined,
              color: whiteColor,
              size: 20.w,
            ).onTap(() {
              locator<NavigationService>().goBack();
            }),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    heightSpace(10.h),
                    vm.state == ViewState.NOINTERNET
                        ? NoInternetPage()
                        : vm.addresses == null || vm.state == ViewState.Busy
                            ? ShimmerAddressItem()
                            : vm.addresses!.isEmpty
                                ? SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        100.h,
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: bold16Text('no addresses'),
                                    ),
                                  ) : ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, i) {
                                      return AddressListItem(
                                          viewModel: vm,
                                          address: vm.addresses![i]);
                                    },
                                    itemCount: vm.addresses!.length,
                                  ),
                    heightSpace(20.h),
                    Row(
                      children: [
                        StyledButton(
                          function: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => NewShippingAddressScreen(
                                      address: null,
                                    )));
                          },
                          child: reg14Text('NEW', color: whiteColor),
                          fillColor: secondaryColor,
                          width: 146.w,
                        ),
                      ],
                    )
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
