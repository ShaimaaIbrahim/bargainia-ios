import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Locator.dart';
import '../../../utils/texts.dart';

class FinalAddProductScreen extends StatelessWidget {
  final code;
  const FinalAddProductScreen({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: bold16Text('ADD PRODUCT', color: whiteColor),
        centerTitle: true,
        leading: Icon(
          Icons.search,
          color: whiteColor,
          size: 30.w,
        ),
        actions: [
          Icon(
            Icons.filter_list,
            color: whiteColor,
            size: 30.w,
          )
        ],
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 heightSpace(120.h),
                 Container(
                   height: 100.h,
                   width: 100.w,
                   decoration: BoxDecoration(
                       color: whiteColor,
                       shape: BoxShape.circle
                   ),
                   child: Center(
                       child:  Icon(Icons.done, color: Colors.green, size: 40.w,)
                   ),
                 ),
                 heightSpace(30.h),
                 normal30Text('Thank You\n Your listing is created!', color: textColor),
                 normal20Text('IPhone11', color: secondaryColor),
                 normal20Text('Listing Code', color: textColor),
                 bold24Text(code, color: secondaryColor),
                 normal16Text('This code uniquely identifies your\n listing on bargainia'),
                 heightSpace(20.h),
                 _buildGoMyProducts()

               ],
            ),
          )
        ),
      ),
    );
  }
  _buildGoMyProducts(){
   return Container(
     width: 200.w,
     decoration: BoxDecoration(
         color: secondaryColor,
         borderRadius: BorderRadius.all(Radius.circular(5.w)),
       boxShadow: [
         BoxShadow(
           color: greyColor,
           blurRadius: 2,
           offset: Offset(1, 1), // Shadow position
         ),
       ],
     ),
     child: Padding(
       padding: EdgeInsets.only(left: 20.w, top: 15.h, bottom: 15.h, right: 20.w),
       child: Row(
         children: [
           Container(
             height: 40.h,
             width: 40.w,
             decoration: BoxDecoration(
                 color: whiteColor,
                 shape: BoxShape.circle
             ),
             child: Center(
                 child:  Icon(Icons.arrow_back_ios_outlined, color: secondaryColor,)
             ),
           ),
           widthSpace(15.w),
           bold12Text('MY PRODUCTS',color: whiteColor),

         ],
       ),
     ),
   ).onTap((){
     locator<NavigationService>().navigateTo(RouteName.MyProducts);
   });
  }
}
