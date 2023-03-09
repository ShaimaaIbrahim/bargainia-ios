import 'package:bargina/screens/main/home/like4card/see_all_cards_page.dart';
import 'package:flutter/material.dart';
import 'package:bargina/screens/main/home/like4card/like4card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/screens/main/home/widgets/filter_categoty_product.dart';
import 'package:bargina/screens/main/home/widgets/product_category_shimmer_item.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Locator.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/texts.dart';
import '../../../../widgets/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
class SeeAllCardChildsPage extends StatelessWidget {
  final  childs;

  const SeeAllCardChildsPage({Key? key, this.childs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeViewModel>(
      onModelReady: (_) {
        //_.getLike4CardsCategoriesProducts(context, id);
      },
      builder: (_, vm, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: bold16Text('LikeCards Types', color: whiteColor),
            centerTitle: true,
            leading: Icon(
              Icons.arrow_back_ios_rounded, color: whiteColor, size: 20.w,)
                .onTap(() {
              locator<NavigationService>().goBack();
            }),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.h, right: 10.w, left: 10.w),
                    child: Column(
                      children: [
                        heightSpace(21.h),
                        childs.isEmpty  ?
                            Center(
                              child: bold16Text('no products'),
                            ): SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, i) {
                              return _buildLike4cardChild(childs[i], context);
                            },
                            itemCount: childs.length,
                          ),
                        ),

                      ],
                    ),
                  ),
                  heightSpace(100.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  _buildLike4cardChild(child, BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.w)),
        color: whiteColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 20.w, top: 20.h, bottom: 20.h, left: 20.w),
        child: Row(
          children: [

            CachedNetworkImage(
              imageUrl: child.amazonImage,
              imageBuilder: (context, imageProvider) => Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                 // color: lightGrey.withOpacity(0.2),
                  boxShadow: [
                    BoxShadow(
                      color: HexColor('#2424240D'),
                      blurRadius: 20.r,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.contain),
                ),
              ),
              placeholder: (context, url) => Image.asset(  'assets/images/error_image.png' ,width: 80.w, height: 80.h, fit: BoxFit.contain,),
              errorWidget: (context, url, error) => Image.asset('assets/images/error_image.png', width: 80.w, height: 80.h, fit: BoxFit.contain,),
            ),
            widthSpace(20.w),
            bold16Text(child.categoryName),

          ],
           // leading: CachedNetworkmage(url : child.amazonImage, width: 100.w, height: 100.h,),
        ),
      )
    ).onTap((){
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SeeAllCardsPage(id: child.id)));
    });
  }
}
