import 'package:bargina/screens/auth/viewmodel/auth_view_model.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/services/firebase_services.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Locator.dart';
import '../../enums/ScreenState.dart';
import '../../routes/RoutesNames.dart';
import '../../services/navigation_service.dart';
import '../../widgets/socila_button.dart';
import '../../widgets/styled_text_field.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart' as asi;

import 'package:google_sign_in/google_sign_in.dart';
class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AuthViewModel>(
      builder: (_, vm, child) {
        return Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
                child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          color: primaryDarkColor,
                          child: Padding(
                              padding: EdgeInsets.only(
                                top: 20.h,
                              ),
                              child: Image.asset('assets/images/logo.png',
                                  height: 200.h,
                                  width: MediaQuery.of(context).size.width)),
                        ),
                      ],
                    ),
                    Positioned(
                        top: 126.h,
                        right: 16.w,
                        left: 16.w,
                        child: _buildSignInWidget(vm, context))
                  ],
                ),
              ),
            )));
      },
    );
  }

  _buildSignInWidget(AuthViewModel viewModel, BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              color: whiteColor),
          child: Padding(
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 14.h, bottom: 16.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      bold30Text('welcome,'),
                      Spacer(),
                      reg18Text('SignUp', color: secondaryColor).onTap(() {
                        locator<NavigationService>()
                            .navigateTo(RouteName.SignUp);
                      })
                    ],
                  ),
                  heightSpace(10.h),
                  reg14Text('Sign in to Continue', color: HexColor('#929292')),
                  heightSpace(50.h),
                  StyledTextField(
                    labelText: 'Phone',
                    controller: viewModel.phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  heightSpace(40.h),
                  StyledTextField(
                    labelText: 'password',
                    controller: viewModel.passwordController,
                    isPassword: true,
                  ),
                  heightSpace(20.h),
                  reg14Text('Forgot Password?', align: TextAlign.end).onTap(
                    () {
                      locator<NavigationService>()
                          .navigateTo(RouteName.ForgetPassword);
                    },
                  ),
                  heightSpace(20.h),
                  viewModel.state == ViewState.Busy
                      ? Center(
                          child: CircularProgressIndicator(
                          color: secondaryColor,
                        ))
                      : StyledButton(
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              viewModel.signIn(context);
                            }
                          },
                          radius: true,
                          child: reg14Text('SIGN IN', color: whiteColor),
                          fillColor: secondaryColor,
                        )
                ],
              ),
            ),
          ),
        ),
        heightSpace(30.h),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 20.w,
                height: 2.h,
                color: blackColor,
              ),
              widthSpace(10.w),
              reg18Text('OR'),
              widthSpace(10.w),
              Container(
                width: 20.w,
                height: 2.h,
                color: blackColor,
              ),
            ],
          ),
        ),
        heightSpace(10.h),
        asi.AppleSignInButton(
          style: asi.ButtonStyle.black,
          type: asi.ButtonType.signIn,
          onPressed: () => _signInWithApple(context),
        )
      // StocialButton(
      //           function: () async {
      //             await locator<FirebaseServices>().loginFacebook(context);
      //           },
      //           text: 'Sign In with Facebook',
      //           fillColor: whiteColor,
      //           image: 'assets/icons/face.png',
      //         ),
      //   heightSpace(10.h),
      //   isIOS ? asi.AppleSignInButton(
      //     style: asi.ButtonStyle.black,
      //     type: asi.ButtonType.signIn,
      //     onPressed: () => _signInWithApple(context),
      //   ):
      //   StocialButton(
      //     function: () async {
      //       await locator<FirebaseServices>()
      //           .signInWithGoogle(context: context);
      //     },
      //     text: 'Sign In with Google',
      //     fillColor: whiteColor,
      //     image: 'assets/icons/google.png',
      //   ),
      ],
    );
  }
  Future<void> _signInWithApple(BuildContext context) async {
    try {
      final user = await locator<FirebaseServices>().signInWithApple(
          scopes: [asi.Scope.email, asi.Scope.fullName], context: context);
    } catch (e) {

      print(e);
    }
  }

}
