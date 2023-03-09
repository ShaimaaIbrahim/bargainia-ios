import 'package:bargina/utils/colors.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String url;
  final double  radius;

  const CircleImage( {Key? key, required this.url, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: whiteColor,
      backgroundImage: NetworkImage(url,),
    );
  }
}