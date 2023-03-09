import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/texts.dart';
import '../../home/product_details_page.dart';
import 'package:hexcolor/hexcolor.dart';
class SearchItemList extends StatelessWidget {
  dynamic product;
   SearchItemList({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.w)),
                border: Border.all(color: Colors.grey, width: 1.w)
            ),
            child: Padding(
              padding: EdgeInsets.all(5.w),
              child: CachedNetworkmage(
                url: product.image  ?? '', width: 100.w, height: 130.h,
              ),
            ),
          ),
          widthSpace(30.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingBar(
                initialRating: 3,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 15.w,
                ratingWidget: RatingWidget(
                  full: Icon(Icons.star, color: Colors.amber, size: 5.w,),
                  half: Icon(Icons.star, color: Colors.amber, size: 5.w,),
                  empty: Icon(Icons.star, color: Colors.amber,size: 5.w,),
                ),
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {
                },
              ),
              heightSpace(10.h),
              Container(
                  width: 150.w,
                  child: med16Text(product.title??'Huaweis Tablet', color: blackColor.withOpacity(.8))),
              heightSpace(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  reg12withLineText('${product.priceDiscount} SR',color: HexColor('#515C6F')),
                  widthSpace(5.w),
                  reg14Text('${product.price} SR', color: HexColor('#1E2022')),

                ],
              ),
              heightSpace(15.h),
              Row(
                children: [

                  Icon(Icons.shopping_cart, color: additionColor,),
                  widthSpace(10.w),
                  Icon(product.isFavourite==1 ? Icons.favorite: Icons.favorite_border, color: Colors.red,),
                ],
              )
            ],
          ),
        ],
      ),
    ).onTap((){
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ProductDetailsScreen(id: product.id,)));

    });
  }
}
