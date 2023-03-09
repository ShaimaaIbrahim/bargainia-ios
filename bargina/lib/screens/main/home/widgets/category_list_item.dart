import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:bargina/widgets/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cached_network_image/cached_network_image.dart';
class CategoriListItem extends StatelessWidget {
  dynamic category;
   CategoriListItem({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       Container(
         width: 60.w,
           height: 60.w,
           decoration: BoxDecoration(
               shape: BoxShape.circle,
               color: whiteColor,
             boxShadow: [
               BoxShadow(
                 color: HexColor('#2424240D'),
                 blurRadius: 20.r,
                 offset: Offset(0, 5), // changes position of shadow
               ),
             ],
           ),
           child: Padding(
               padding: EdgeInsets.all(8.w),
               child: Center(
                   child: CircleImage(url: category.image ?? 'https://bargainia.com.sa/storage/uploads/tmpphpryoegr.png', /*width: 35.w, height: 28.h, */radius: 18.r,)))) ,
       heightSpace(13.h),
       reg12Text(category.title ?? 'Laptops')
      ],
    );
  }
}
