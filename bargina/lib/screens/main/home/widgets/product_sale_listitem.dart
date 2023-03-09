import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/screens/main/home/add_product_page.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Locator.dart';
import '../../../../utils/colors.dart';
import 'package:hexcolor/hexcolor.dart';
class ProductSaleListItem extends StatelessWidget {
   dynamic product;
   dynamic catId;

   ProductSaleListItem({Key? key, this.product, this.catId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            border: Border.all(color: Colors.grey, width: 1.w)
        ),
      child: Stack(
        children: [
          Padding(
            padding:
            EdgeInsets.only(left: 13.w, right: 13.w, top: 10.h, bottom: 13.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkmage(
                      url: product.image ?? 'https://bargainia.com.sa/storage/uploads/tmpphpryoegr.png',
                      width: 60.w,
                      height: 72.h,
                    ),
                    widthSpace(16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        med14Text(product.description??'iPhone 12', color: HexColor('#00173F')),
                        heightSpace(10.h),
                        bold16Text('Average Prices', color: secondaryColor),
                        bold16Text(product.price.toString(), color: secondaryColor),
                      ],
                    )
                  ],
                ),
                heightSpace(10.h),
                Row(
                  children: [
                    _buildIconText('Confidence', 'assets/props/Confidence.png'),
                    Spacer(),
                    _buildIconText('No junk', 'assets/props/no-junk.png'),
                  ],
                ),
                heightSpace(10.h),
                Row(
                  children: [
                    _buildIconText('Safe payment', 'assets/props/Safe-payment.png'),
                    Spacer(),
                    _buildIconText('no broken', 'assets/props/no-broken.png'),
                  ],
                ),
                heightSpace(10.h),
                Row(
                  children: [
                    _buildIconText('Shipping', 'assets/props/Shipping.png'),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 10.h,
            right: 10.w,
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  shape: BoxShape.circle
              ),
              child: Center(
                  child:  Icon(Icons.navigate_next, color: whiteColor,)
              ),
            ).onTap((){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                  AddProductScreen(id: product.id, catId: catId, product: product)));

            })
          )
        ],
      )
    );
  }
  _buildIconText(text, icon){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(icon, color: HexColor('#CECECE'), width: 14.w, height: 14.h,),
        widthSpace(5.w),
        reg14Text(text, color: additionColor)
      ],
    );
  }
}
