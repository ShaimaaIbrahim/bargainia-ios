import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/screens/main/home/product_details_page.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../Locator.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductCategoryListItem extends StatelessWidget {
   dynamic product;
   ProductCategoryListItem({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      width: 170.w,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10.w ,),
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(5.w)),
                border: Border.all(width: 1.w, color: Colors.grey)),
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: secondaryColor,
                      //     borderRadius: BorderRadius.all(Radius.circular(20.w)),
                      //   ),
                      //   width: 60.w,
                      //   child: Center(
                      //     child: Padding(
                      //       padding: EdgeInsets.all(4.w),
                      //       child: bold14Text('New', color: whiteColor),
                      //     ),
                      //   ),
                      // ),
                      Visibility(
                        visible: product.older==null || product.older.toString() !='3'   ? false: true,
                        child: Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(20.w)),
                          ),
                          width: 60.w,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(4.w),
                              child: reg14Text(product.older.toString()=='3' ? 'New' : '', color: whiteColor),
                              //child: reg14Text('${_returnDiscount(product.total.toString(), product.priceDiscount==null ? '0.0': product.priceDiscount.toString())} %', color: whiteColor),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: whiteColor, shape: BoxShape.circle),
                          child: Icon(
                            product.isFavourite ==1 ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                          )),
                    ],
                  ),
                  //heightSpace(10.h),
                  CachedNetworkmage(
                    url: product.image,
                    height: 100.h,
                    width: 100.w,
                  )
                ],
              ),
            ),
          ),
          heightSpace(5.h),
          RatingBar(
            initialRating: _getCountRate(product.countRate),
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 15.w,
            ratingWidget: RatingWidget(
              full: Icon(Icons.star, color: Colors.amber, size: 5.w,),
              half: Icon(Icons.star_half_rounded, color: Colors.amber, size: 5.w,),
              empty: Icon(Icons.star_border, color: Colors.amber,size: 5.w,),
            ),
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            onRatingUpdate: (rating) {
            },
          ),
          //Expanded(child: normal16Text(product.description.toString().length > 20 ? product.description.toString().substring(0, 19) :product.description.toString() , color: HexColor('#00173F'),)),
          product.priceDiscount.toString() != '0' && product.priceDiscount.toString() !='0.0' && product.priceDiscount !=null ?   Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              reg12withLineText('${_buildTotal(product.total.toString(), product.priceDiscount==null ? '0.0': product.priceDiscount.toString())} SAR', color: HexColor('#515C6F')),
              widthSpace(5.w),
              reg14Text('${product.total} SAR', color: HexColor('#1E2022') ),
            ],
          ): reg14Text('${product.total} SAR', color: HexColor('#1E2022') ),
          //heightSpace(10.h)
        ],
      ),
    ).onTap((){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetailsScreen(id: product.id)));
    });
  }
}
dynamic _returnDiscount(price , priceDiscount){
  return (double.parse(priceDiscount)/double.parse(price) * 100).toStringAsFixed(1);
}

_buildTotal(String total, String discount) {
  return double.parse(total) + double.parse(discount);
}

 _getCountRate(countRate) {
  if(countRate == null){
    return 0.0;
  }
  else{
    return countRate.toDouble();
  }
}
