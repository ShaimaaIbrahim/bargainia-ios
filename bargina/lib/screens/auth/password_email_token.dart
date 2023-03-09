import 'package:bargina/screens/auth/viewmodel/auth_view_model.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Locator.dart';
import '../../enums/ScreenState.dart';
import '../../routes/RoutesNames.dart';
import '../../services/navigation_service.dart';
import '../../widgets/styled_text_field.dart';
import '../../utils/colors.dart';
import 'package:hexcolor/hexcolor.dart';

class PasswordEmailToken extends StatelessWidget {
  final email;
   PasswordEmailToken({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AuthViewModel>(
      onModelReady: (_){
        _.emailController.text = email;
      },
      builder: (_, vm, child){
        return Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        // Container(
                        //   height: 280.h,
                        //   width: MediaQuery.of(context).size.width,
                        //   color: primaryColor,
                        //   child: Padding(
                        //     padding: EdgeInsets.only(top: 68.h,),
                        //     child: Image.asset('assets/icons/google.png', height: 45.h, width: 160.w,),
                        //   ),
                        // ),
                        Container(
                          color: primaryDarkColor,
                          child: Padding(
                              padding: EdgeInsets.only(top: 20.h,),
                              child:  Image.asset('assets/images/logo.png', height: 200.h, width:MediaQuery.of(context).size.width)
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        top: 126.h,
                        right: 16.w,
                        left: 16.w,
                        child: _buildForgetPasswordWidget(context, vm)
                    )
                  ],
                )
            )
        );
      },
    );

  }

  _buildForgetPasswordWidget(BuildContext context, AuthViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          color: whiteColor
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 14.h, bottom: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bold30Text('Enter Password EmailToken'),
            heightSpace(50.h),
            StyledTextField(labelText: 'Email', controller: viewModel.emailController,),
            heightSpace(50.h),
            StyledTextField(labelText: 'Token', controller: viewModel.tokenController,),
            heightSpace(100.h),
            viewModel.state == ViewState.Busy ?  Center(
                child: CircularProgressIndicator(
                    color: secondaryColor)):  StyledButton(function: (){
              viewModel.passwordEmailToken(context, email);
            },  fillColor: secondaryColor,
              radius: true,
              child: reg14Text('SEND', color: whiteColor),)
          ],
        ),
      ),
    );
  }

}
