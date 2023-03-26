import 'dart:io';

import 'package:badges/badges.dart';
import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/models/purchases_model.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/cart/viewmodel/cart_viewmodel.dart';
import 'package:bargina/screens/main/home/widgets/product_details_shimmer.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../Locator.dart';
import '../../../../routes/RoutesNames.dart';
import '../../../../services/in_app_purchases_services.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/loading_screen.dart';
import '../../../../utils/texts.dart';
import '../../cart/checkout/checkout_page.dart';
import '../../model/like4card_cat_product.dart';


class Like4CardDetailsPage extends StatefulWidget {
  final Like4cardCatProduct cardItem;
   Like4CardDetailsPage({Key? key,  required this.cardItem}) : super(key: key);

  @override
  State<Like4CardDetailsPage> createState() => _Like4CardDetailsPageState();
}

class _Like4CardDetailsPageState extends State<Like4CardDetailsPage> {
  @override
  bool loading=false;
@override

  Widget build(BuildContext context) {
    return BaseScreen<CartViewModel>(
      onModelReady: (_){
        _.getPaymentsMethods(context);
      },
      builder: (_, vm, child){
        return LoadingScreen(
          loading: loading,
          child: Scaffold(
            backgroundColor: HexColor('#E6E8EA'),
            body: SafeArea(
              child: SingleChildScrollView(
                child: widget.cardItem == null  ? ProductDetailsShimmer() : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace(10.h),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w, left: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_outlined,
                            color: secondaryColor,
                            size: 20.w,
                          ).onTap((){
                            locator<NavigationService>().goBack();
                          }),
                          const Spacer(),
                          Badge(
                            badgeContent: bold12Text(vm.count.toString(),
                                color: secondaryColor),
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.grey[700],
                            ),
                          ).onTap(() {
                            Navigator.of(context).pushNamed(RouteName.MainPage);
                          })
                          // Badge(
                          //   badgeContent: bold12Text(vm.getCartItemsCountBadge(), color: secondaryColor),
                          //   child: Icon(Icons.shopping_cart, color: Colors.grey[700],),
                          // )
                        ],
                      ),
                    ),
                    heightSpace(15.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: CachedNetworkmage(
                        url: widget.cardItem.productImage.toString(),
                        width: MediaQuery.of(context).size.width,
                        height: 206.h,
                      ),
                    ),
                    heightSpace(20.h),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25.w)),
                          color: whiteColor),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 24.w, top: 39.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            bold22Text(widget.cardItem.productName.toString(), color: HexColor('#515C6F')),
                            heightSpace(10.h),
                            bold18Text('${widget.cardItem.totalPrice} SAR', color: secondaryColor),
                            //heightSpace(15.h),
                          //   Divider(height: 1.h, color: HexColor('#727C8E'),),
                          //   heightSpace(15.h),
                          //   med18Text('Payment Method', color: HexColor('#00173F')),
                          //   heightSpace(15.h),
                          //   //payment methods--
                          // vm.paymentMethods==null ? SizedBox():  SizedBox(
                          //     height: 40.h,
                          //     child: ListView.builder(
                          //       shrinkWrap: true,
                          //       scrollDirection: Axis.horizontal,
                          //       physics: const BouncingScrollPhysics(),
                          //       itemBuilder: (context, i) {
                          //         return CachedNetworkmage(url: vm.paymentMethods![i].logo, width: 80.w, height: 40.h,);
                          //       },
                          //       itemCount: vm.paymentMethods!.length,
                          //     ),
                          //   ),
                            heightSpace(25.h),
                            Divider(height: 1.h, color: HexColor('#727C8E'),),
                            heightSpace(25.h),
                            Center(
                              child: StyledButton(
                                function: () async{
                                  if(Platform.isIOS){
                                    setState(() {loading=true;});
                                    CartViewModel product=CartViewModel();
                                   PurchasesModel? data=await product.purchasesOrder(context, widget.cardItem.productId);
                                    setState(() {loading=false;});
                                    // todo coll api
                                    if(data!=null){

                                      InAppPurchases.inAppPurchases(
                                        transactionId: data.orderReference.toString(),
                                        productId:data.productId.toString(),
                                      );
                                    }
                                  }else{
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => CheckOutPage(
                                                digital:true,
                                                productId: widget.cardItem.productId,
                                                quantity: vm.quantity)));
                                  }
                                 // locator<CartViewModel>().checkoutpage(context, cardItem.totalPrice);
                                },
                                fillColor: secondaryColor,
                                width: 200.w,
                                radius: true,
                                child: semiBold14Text('CHECKOUT', color: whiteColor),
                              ),
                            ),

                          ],
                        ),
                      ),
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
