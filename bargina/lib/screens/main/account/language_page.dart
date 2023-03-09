import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';
import '../../../Locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AccountViewModel>(
      builder: (_, vm, child){
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar:AppBar(
            backgroundColor: primaryColor,
            title: bold16Text('Language', color: whiteColor),
            centerTitle: true,
            leading: Icon(Icons.arrow_back_ios_outlined, color: whiteColor, size: 20.w,).onTap((){
              locator<NavigationService>().goBack();
            }),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  Row(
                    children: [
                     vm.isArabic ? Container(): Icon(Icons.done, color: primaryColor,),
                      widthSpace(25.w),
                      bold16Text('English',)
                    ],
                  ).onTap((){
                     vm.setEnglishLang(context);
                  }),
                  heightSpace(20.h),
                  Divider(height: 3.h, color: Colors.grey,),
                  heightSpace(20.h),
                  Row(
                    children: [
                     vm.isArabic?  Icon(Icons.done, color: primaryColor,): Container(),
                      widthSpace(25.w),
                      bold16Text('العربية',)
                    ],
                  ).onTap((){
                    vm.setArabicLang(context);
                  }),
                  heightSpace(10.h),
                  //  Divider(height: 3.h, color: Colors.grey,),
                ],
              ),
            ),
          ),
        );
      },
    );

  }
}
