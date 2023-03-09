import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../Locator.dart';
import '../../utils/colors.dart';
import '../../utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AccountViewModel>(
      onModelReady: (_){
        _.getReturnPolicy(context);
        _.getDealWithBargina(context);
      },
      builder: (_, vm, child){
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar:AppBar(
            backgroundColor: primaryColor,
            title: reg20Text('Support', color: whiteColor),
            centerTitle: true,
            leading: Icon(Icons.arrow_back_ios_outlined, color: whiteColor, size: 20.w,).onTap((){
              locator<NavigationService>().goBack();
            }),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child:  Padding(
                padding: EdgeInsets.all(20.h),
                child: Column(
                  children: [
                    _buildHowDropWidget('Return policy', vm, 0, vm.returnPolicy),
                    heightSpace(20.h),
                    _buildHowDropWidget('Deal with barginia', vm, 1, vm.dealwith)
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );

  }
  _buildHowDropWidget(title, AccountViewModel viewModel, index, content){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        color: whiteColor,
        boxShadow:  [
      BoxShadow(
      color: Colors.grey,
        offset: const Offset(
          5.0,
          5.0,
        ),
        blurRadius: 10.0,
        spreadRadius: 2.0,
      ), //BoxShadow
      BoxShadow(
        color: Colors.grey,
        offset: const Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ), //BoxShadow
      ],
    ), 
      child: Padding(
        padding: EdgeInsets.only(left: 13.w, right: 13.w, top: 10.h, bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                med16Text(title, color: primaryLightColor),
                Spacer(),
                Icon(Icons.arrow_drop_down_outlined, color: primaryLightColor,)
              ],
            ).onTap((){
               viewModel.slideUp(index);
            }),
            heightSpace(10.h),
            Visibility(
                visible: viewModel.visible[index],
                 child: reg14Text(content)),
          ],
        )
      ),
    );
  }
}
