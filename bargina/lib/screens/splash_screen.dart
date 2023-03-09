import 'package:bargina/services/shared_prefrence_services.dart';
import 'package:bargina/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../Locator.dart';
import '../routes/RoutesNames.dart';
import '../services/navigation_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController? controller;
  Animation? colorAnimation;
  Animation? widthAnimation;
  Animation? heightAnimation;

  @override
  void initState() {

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    widthAnimation = Tween<double>(begin: 50, end: 800).animate(controller!)
      ..addListener(() {
        setState(() {});
      })..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller!.forward();
        }
      });

      heightAnimation = Tween<double>(begin: 50, end: 800).animate(controller!)..addListener(() {

      })..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller!.forward();
        }
      });

    controller!.forward();

    Future.delayed(const Duration(seconds: 4), () {
      locator<NavigationService>().navigateTo(RouteName.MainPage);
      // locator<SharedPreferencesServices>().checkLogin().then((value) {
      //   if(value==true){
      //     locator<NavigationService>().navigateTo(RouteName.MainPage);
      //   }else{
      //     locator<NavigationService>().navigateTo(RouteName.SignIn);
      //   }
      // });
    });

    super.initState();
  }

  @override
  void dispose() {

    controller!.stop();
    controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 811));
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryDarkColor,
          child: Center(
            child: Image.asset('assets/images/splash_logoo.PNG', height: heightAnimation!.value, width: widthAnimation!.value,),
          ),
        ),
      ),
    );
  }
}

