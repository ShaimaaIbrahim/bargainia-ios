import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/viewmodel/main_viewmodel.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Locator.dart';
import '../../utils/colors.dart';
import '../../utils/texts.dart';
import 'package:hexcolor/hexcolor.dart';
class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<MainViewModel>(
      onModelReady: (_){
        _.getTerms(context);
      },
      builder: (_, vm, child){
        return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: reg20Text('Terms and Condition', color: whiteColor),
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
                child: SizedBox(
                 // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height* 0.9,
                  child: Stack(
                    children: [

                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(top: 34.h, right: 19.w, left: 19.w),
                          child: Column(
                            children: [
                              vm.termsConditionsModel==null ? Container() : light14Text(vm.termsConditionsModel!.content!, color: HexColor('#1E272E')),
                              heightSpace(70.h),

                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.h,
                        left: 0.w,
                        right: 0.w,
                        child: StyledButton(
                          height: 60.h,
                          function: (){
                        }, fillColor: HexColor('#969CA2'),  child: bold20Text('I AGREE', color: whiteColor),),
                      )
                    ],
                  ),
                )));
      },
    );

  }
}
