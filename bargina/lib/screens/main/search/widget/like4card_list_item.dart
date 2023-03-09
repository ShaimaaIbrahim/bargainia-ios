import 'package:bargina/screens/main/home/like4card/see_all_card_childs_page.dart';
import 'package:bargina/screens/main/home/like4card/see_all_cards_page.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/texts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hexcolor/hexcolor.dart';
class Like4ListItem extends StatelessWidget {
  final category;
  const Like4ListItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: category.amazonImage,
            imageBuilder: (context, imageProvider) => Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightGrey.withOpacity(0.2),
                // boxShadow: [
                //   BoxShadow(
                //     color: HexColor('#2424240D'),
                //     blurRadius: 20.r,
                //     offset: Offset(0, 5), // changes position of shadow
                //   ),
                // ],
                image: DecorationImage(
                    image: imageProvider, fit: BoxFit.contain),
              ),
            ),
            placeholder: (context, url) => Image.asset(  'assets/images/error_image.png' ,width: 80.w, height: 80.h, fit: BoxFit.contain,),
            errorWidget: (context, url, error) => Image.asset('assets/images/error_image.png', width: 80.w, height: 80.h, fit: BoxFit.contain,),
          ),
          // Container(
          //   width: 60.w,
          //   height: 60.h,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //   ),
          //   child: CircleAvatar(
          //     radius: 30.r,
          //     child: ClipRect(
          //       child: CachedNetworkmage(
          //         width: 100.w,
          //         height: 100.h,
          //         url:  category.amazonImage
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //     decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: whiteColor
          //     ),
          //     child: Center(
          //         child: CircleImage(url: category.amazonImage ?? 'https://bargainia.com.sa/storage/uploads/tmpphpryoegr.png', /*width: 35.w, height: 28.h, */radius: 30,))) ,
          heightSpace(10.h),
          bold12Text(category.categoryName ?? 'Laptops')
        ],
      ),
    ).onTap((){
     Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SeeAllCardChildsPage(childs: category.childs,)));
    });
  }
}
