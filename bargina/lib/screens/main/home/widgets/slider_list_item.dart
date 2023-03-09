import 'package:bargina/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderListItem extends StatelessWidget {
  const SliderListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.w)),),
      child: CachedNetworkmage(
        url: 'https://img.freepik.com/free-psd/new-collection-fashion-sale-web-banner-template_120329-1507.jp'
            'g?t=st=1649914500~exp=1649915100~hmac=976f186b0734008d24e0af9feaa6d8b2dffc12e27a57117a0d5bfa531'
            'a0598da' , height: 110.h, width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
