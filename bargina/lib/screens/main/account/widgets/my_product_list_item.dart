import 'dart:developer';

import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/screens/main/account/model/my_product_model.dart';
import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/screens/main/account/widgets/statuc_icon_widget.dart';
import 'package:bargina/screens/main/account/widgets/status_widget.dart';
import 'package:bargina/screens/main/home/add_product_page.dart';
import 'package:bargina/screens/main/home/pages/add_discount_page.dart';
import 'package:bargina/screens/main/home/pages/add_used_product_page.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../../../Locator.dart';
import 'package:hexcolor/hexcolor.dart';

import '../add_copoun_page.dart';

class MyProductListItem extends StatelessWidget {
  MyProductModel? product;
  AccountViewModel viewModel;

  MyProductListItem({Key? key, this.product, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
        boxShadow: [
          BoxShadow(
            color: HexColor('#2424240D'),
            blurRadius: 15,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 26.h),
      child: Padding(
        padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 5.w),
        child: Row(
          children: [
            Container(
              width: 71.w,
              //height: .h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                  border: Border.all(color: HexColor('#E1E1E1'), width: 1.w)),
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: CachedNetworkmage(url: product!.mainImg ?? ''),
              ),
            ),
            widthSpace(14.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: med16Text(product!.name!),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildIconContainer('assets/icons/status.png', (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> AddDiscountPage(productId: product!.id)));
                        }),
                        widthSpace(6.w),
                        _buildIconContainer('assets/icons/deleat.png', (){
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.WARNING,
                            headerAnimationLoop: false,
                            animType: AnimType.TOPSLIDE,
                            showCloseIcon: true,
                            closeIcon: const Icon(Icons.close_fullscreen_outlined),
                            title: 'Warning',
                            desc: 'Are You Sure Delete Product',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              viewModel.deleteProduct(context, product!.id);
                            },
                          ).show();
                        }),
                        widthSpace(6.w),
                        _buildIconContainer('assets/icons/edit.png', (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_)=> AddProductScreen(
                                   catId: product!.catId,
                                   id: product!.id!,
                                   //product: product!,
                                   myPoductModel: product,
                                   edit: true)));
                        })
                      ],
                    )
                  ],
                ),
                reg14Text('${product!.price} SAR', color: secondaryColor),
                heightSpace(12.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildStock('', product!.st!),
                    widthSpace(5.w),
                    StatusWidget(
                        fillColor: secondaryColor,
                        borderColor: primaryColor,
                        text: product!.orderType!),
                    widthSpace(5.w),
                    StatusIconWidget(text: product!.wayName ?? ''),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  _buildStock(text, int st){
    return Container(
      height: 24.h,
      width: 63.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.w)),
          color: st==1 ? Colors.green: Colors.red

      ),
      child: Center(
        child: Padding(
            padding: EdgeInsets.all(3.w),
            child: med11Text(st==1 ? 'In Stock' : 'Out Stock', color: whiteColor)),
      ),
    );
  }

  _buildIconContainer(icon, function) {
    return Container(
      width: 21.w,
      height: 21.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.w)),
          border: Border.all(width: 1.w, color: Colors.grey),
          color: greyColor),
      child: Center(
        child: Image.asset(
          icon,
          width: 21.w,
          height: 21.h,
        ),
      ),
    ).onTap((){
       function();
    });
  }
}
