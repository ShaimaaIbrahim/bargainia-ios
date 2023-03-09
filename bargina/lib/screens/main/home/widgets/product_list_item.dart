import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Locator.dart';
import '../products_forsell_page.dart';
class ProductListItem extends StatelessWidget {
   dynamic product;
   ProductListItem({Key? key, this.product}) : super(key: key);

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
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkmage(url: product.image ?? 'https://bargainia.com.sa/storage/uploads/tmpphpryoegr.png', width: 100.w, height: 50.h,),
                widthSpace(15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reg18Text(product.title?? 'Windows Laptop for sale', color: textColor),
                    heightSpace(10.h),
                    RichText(
                      text: TextSpan(
                        text: product.productsCount.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold, color: secondaryColor, fontSize: 18.sp),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Items',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: blackColor)),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.h,
            right: 10.w,
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: secondaryColor,
                shape: BoxShape.circle
              ),
              child: Center(
               child:  Icon(Icons.navigate_next_rounded, color: whiteColor,)
              ),
            ).onTap((){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductsForSellPage(id: product.id, name: product.title,)));
            }),
          )
        ],
      )
    );
  }
}
