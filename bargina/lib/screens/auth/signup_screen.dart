import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/models/Status.dart';
import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/screens/auth/viewmodel/auth_view_model.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Locator.dart';
import '../../services/navigation_service.dart';
import '../../utils/colors.dart';
import '../../utils/common_functions.dart';
import '../../utils/texts.dart';
import '../../widgets/styled_button.dart';
import '../../widgets/styled_text_field.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AuthViewModel>(
      builder: (_, vm, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
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
                  bottom: 0.h,
                  child: _buildSignUpWidget(vm, context)),
              Positioned(
                  top: 0.h,
                  right: 0.w,
                  child: Image.asset(
                    "assets/icons/next.png",
                    color: Colors.white,
                    height: 40.h,
                    width: 40.w,
                  ).onTap(() {
                    locator<NavigationService>().goBack();
                  })),
            ],
          )),
        );
      },
    );
  }

  _buildSignUpWidget(AuthViewModel viewModel, BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.r)),
            color: whiteColor),
        child: Padding(
          padding:
              EdgeInsets.only(left: 16.w, right: 16.w, top: 14.h, bottom: 16.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    bold30Text('SignUp'),
                    Spacer(),
                    reg18Text('Sign Up as a company', color: secondaryColor)
                        .onTap(() {
                      locator<NavigationService>()
                          .navigateTo(RouteName.VendorRegister);
                    })
                  ],
                ),
                heightSpace(50.h),
                StyledTextField(
                  labelText: 'FirstName',
                  controller: viewModel.firstNameController,
                ),
                heightSpace(20.h),
                StyledTextField(
                  labelText: 'LastName',
                  controller: viewModel.lastNameController,
                ),
                heightSpace(20.h),
                StyledTextField(
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: viewModel.emailController,
                ),
                heightSpace(20.h),
                StyledTextField(
                  labelText: 'Phone',
                  keyboardType: TextInputType.number,
                  controller: viewModel.phoneController,
                ),
                heightSpace(20.h),
                StyledTextField(
                  labelText: 'Password',
                  isPassword: true,
                  controller: viewModel.passwordController,
                ),
                heightSpace(20.h),
                StyledTextField(
                  labelText: 'Confirm Password',
                  isPassword: true,
                  controller: viewModel.confirmPassController,
                ),
                heightSpace(60.h),
                viewModel.state == ViewState.Busy
                    ? Center(
                        child: CircularProgressIndicator(
                          color: secondaryColor,
                        ),
                      )
                    : StyledButton(
                        function: () {
                          if (_formKey.currentState!.validate()) {
                            viewModel.signUp(context);
                          }
                        },
                        fillColor: secondaryColor,
                        radius: true,
                        child: reg14Text(
                          'SIGN UP',
                          color: whiteColor,
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
