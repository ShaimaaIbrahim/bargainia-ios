import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/account/model/transfer_model.dart';
import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/screens/main/account/widgets/transfer_listitem.dart';
import 'package:bargina/screens/no_internet_connection_page.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/colors.dart';
import '../../../utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../cart/widgets/shimmer_address_item.dart';

class AccountTransferPage extends StatelessWidget {
  const AccountTransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AccountViewModel>(
      onModelReady: (_){
        _.getMyTransfers(context);
      },
      builder: (_, vm, child){
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: reg20Text('Account Transfer', color: whiteColor),
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
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
                  child: vm.state==ViewState.NOINTERNET ?
                  NoInternetPage() : vm.transferModel==null || vm.state==ViewState.Busy ?
                  ShimmerAddressItem() : Column(
                    children: [
                      _buildTotalTransferWidget(vm.transferModel!),
                      heightSpace(30.h),
                      vm.transferModel==null ? ShimmerAddressItem() : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, i) {
                          return  TransferListItem(
                            transfer: vm.transferModel!.transfers![i]
                          );
                        },
                        itemCount: vm.transferModel!.transfers!.length,
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
    );

  }

  _buildTotalTransferWidget(TransferModel transferModel) {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 15,
              offset: const Offset(
                0.0,
                5.0,
              ),
            ),
          ]),
      child: Padding(
        padding:
            EdgeInsets.only(right: 12.w, left: 12.w, bottom: 17.h, top: 17.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                med14Text('Baraginia Fee', color: additionColor),
                Spacer(),
                bold14Text(transferModel.bargina.toString(), color: additionColor),

              ],
            ),
            heightSpace(7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                med14Text('Total Seller Balance', color: additionColor),
                Spacer(),
                bold14Text(transferModel.seller.toString(), color: additionColor),
              ],
            ),
            heightSpace(7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                med14Text('Outstanding Balance', color: additionColor),
                Spacer(),
                bold14Text(transferModel.sellAll.toString(), color: additionColor),

              ],
            ),
            heightSpace(7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                med14Text('Total Price', color: HexColor('#1E272E')),
                Spacer(),
                bold14Text(transferModel.storeAvliable.toString(), ),

              ],
            ),
            heightSpace(7.h),
          ],
        ),
      ),
    );
  }
}
