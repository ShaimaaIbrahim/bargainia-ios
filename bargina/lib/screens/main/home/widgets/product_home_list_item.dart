
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
class ProductHomeListItem extends StatelessWidget {
  dynamic product;
  ProductHomeListItem({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      width: 170.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(right: 15.w ,),
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(5.w)),
                    border: Border.all(width: 1.w, color: Colors.grey)),
                child: Padding(
                  padding: EdgeInsets.only(right: 10.w, left: 10.w, bottom: 5.h, top: 5.h),
                  child: Column(
                    children: [
                      CachedNetworkmage(
                        url: product.image,
                        height: 150.h,
                        width: 150.w,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 15.h,
                left: 15.w,
                child: Visibility(
                  visible: product.priceDiscount.toString() == '0' || product.priceDiscount.toString() =='0.0' ? false: true,
                  child: Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.w)),
                    ),
                    width: 60.w,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(4.w),
                        child: reg14Text('${_returnDiscount(product.total.toString(), product.priceDiscount.toString())} %', color: whiteColor),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.h,
                right: 5.w,
                child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: whiteColor, shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: HexColor('#2424240D'),
                          blurRadius: 20.r,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      product.isFavourite ==1 ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    )),
              ),
            ],
          ),
          heightSpace(5.h),
          RatingBar(
            initialRating: product.countRate.toDouble() ?? 0,
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
          Expanded(child: reg16Text(product.description.toString().length > 20 ? product.description.toString().substring(0, 19) :product.description.toString() , color: HexColor('#00173F'),)),
          product.priceDiscount.toString() != '0' && product.priceDiscount.toString() !='0.0'?   Row(
            children: [
              reg12withLineText('${_buildTotal(product.total.toString(), product.priceDiscount.toString())} SAR', color: HexColor('#515C6F')),
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

  _buildTotal(String total, String discount) {
    return double.parse(total) + double.parse(discount);
  }
}

 dynamic _returnDiscount(price , priceDiscount){
  return (int.parse(priceDiscount)/double.parse(price) * 100).toStringAsFixed(1);
}
//(int.parse(priceDiscount))
/*
   Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(20.w)),
                            ),
                            width: 60.w,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(4.w),
                                child: bold14Text('New', color: whiteColor),
                              ),
                            ),
                          ),
                          Spacer(),
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
                      heightSpace(10.h),
 */