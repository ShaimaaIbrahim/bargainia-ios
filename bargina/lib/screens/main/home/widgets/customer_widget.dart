import 'package:bargina/screens/main/model/review_model.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../widgets/circle_image.dart';
import 'package:hexcolor/hexcolor.dart';
class CustomerInfoWidget extends StatelessWidget {
  ReviewModel rate;
   CustomerInfoWidget({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 9.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.w),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 15.w, right: 15.w, top: 9.h, bottom: 9.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
              children: [
                CircleImage(
                  radius: 35.r,
                  url:
                      'https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?w=996&t=st=1649827111~exp=1649827711~hmac=aa7c5d090089047d8f93408ff3b625439cb7ddd941563f6e746f582e5b35bf20',
                ),
                widthSpace(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reg14Text(rate.name!, color: HexColor('#1E2022')),
                    heightSpace(5.h),
                    RatingBar(
                      initialRating: rate.rate !=null ? rate.rate!.toDouble(): 0.0,
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
                      onRatingUpdate: (rating) {},
                    ),
                    reg12Text(rate.review!, color: HexColor('#1E2022')),
                    // bold12Text('Number of product updated:1', color: Colors.grey),
                    // bold12Text('Total price Active 10', color: Colors.grey),
                    // bold12Text('Shipped from Jaddah to Saudi', color: Colors.grey),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
