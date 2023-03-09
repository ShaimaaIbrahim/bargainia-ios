import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:bargina/widgets/rounded_textfield.dart';
import 'package:bargina/widgets/styled_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/texts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../widgets/styled_button.dart';
import '../../auth/data/products/Product_details.dart';

class AddReviewPage extends StatelessWidget {
  final HomeViewModel viewModel;
  final ProductDetails productDetails;
  const AddReviewPage({Key? key, required this.viewModel , required this.productDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: primaryColor,
        title: reg20Text('Add Review', color: whiteColor),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_rounded, color: whiteColor, size: 20.w,).onTap((){
          locator<NavigationService>().goBack();
        }),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:  Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpace(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkmage(url: productDetails.image!, width: 120.w, height: 120.h,),
                    widthSpace(30.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        med16Text(productDetails.title!),
                        heightSpace(10.h),
                        med16Text(productDetails.price!, color: secondaryColor)
                      ],
                    )
                  ],
                ),
                heightSpace(20.h),
                Divider(height: 1.h, color: blackColor.withOpacity(0.9),),
                heightSpace(20.h),
                Center(
                  child: Column(
                    children: [
                      reg16Text('Your overall rating of this product', color: HexColor('#1E2022')),
                      heightSpace(20.h),
                      RatingBar(
                        initialRating: 3,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 27.w,
                        ratingWidget: RatingWidget(
                          full: Icon(Icons.star, color: Colors.amber, size: 5.w,),
                          half: Icon(Icons.star, color: Colors.amber, size: 5.w,),
                          empty: Icon(Icons.star, color: HexColor('#E1E1E1'),size: 5.w,),
                        ),
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        onRatingUpdate: (rating) {
                          viewModel.setRating(rating);
                        },
                      ),
                    ],
                  ),
                ),
                heightSpace(16.h),
                Divider(height: 1.h, color: blackColor.withOpacity(0.9),),
                heightSpace(20.h),
                reg16Text('Set a Title for your review', color: HexColor('#00173F')),
                heightSpace(11.h),
                RoundedStyledTextField(labelText: '', controller: viewModel.review ),
                // heightSpace(16.h),
                // bold16Text('What did you like or dislike?', ),
                // heightSpace(11.h),
                // RoundedStyledTextField(labelText: '',),
                heightSpace(40.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: StyledButton(function: (){
                    viewModel.addREview(context, viewModel.productDetails!.id);
                  } ,
                    child: semiBold14Text('Submit', color: whiteColor),
                    width: 200.w, fillColor: secondaryColor, radius: true,),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
