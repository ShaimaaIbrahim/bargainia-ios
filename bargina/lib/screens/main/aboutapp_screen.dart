import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/viewmodel/main_viewmodel.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors.dart';
import '../../../utils/texts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Locator.dart';

class AboutAppScreen  extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<MainViewModel>(
      onModelReady: (_){
        _.aboutUs(context);
      },
      builder: (_, vm, child){
        return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: reg20Text('About Baragainia App', color: whiteColor),
              centerTitle: true,
              leading: Icon(
                Icons.arrow_back_ios_outlined,
                color: whiteColor,
                size: 20.w,
              ).onTap((){
                locator<NavigationService>().goBack();
              }),
            ),
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: 34.h, right: 19.w, left: 19.w),
                      child: Column(
                        children: [
                          vm.aboutUsModel==null ? Container() : light14Text(vm.aboutUsModel!.content!, color: HexColor('#1E272E'))
                        ],
                      ),
                    ))));
      },
    );

  }
}