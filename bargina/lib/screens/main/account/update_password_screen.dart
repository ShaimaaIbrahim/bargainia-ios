import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/texts.dart';
import '../../../widgets/rounded_textfield.dart';
import '../../../widgets/styled_button.dart';
import 'my_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AccountViewModel>(
      onModelReady: (_){
       // _.getMyAccount(context);
      },
      afterModelReady: (_){
        //_.getMyAccount(context);
      },
      builder: (_, vm, child){
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar:AppBar(
            backgroundColor: primaryColor,
            title: reg20Text('Update Pssword', color: whiteColor),
            centerTitle: true,
            leading: Icon(Icons.arrow_back_ios_rounded, color: whiteColor, size: 20.w,).onTap((){
              locator<NavigationService>().goBack();
            }),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace(10.h),
                    _buildLabelText('Old password'),
                    heightSpace(5.h),
                    RoundedStyledTextField(labelText: '', controller: vm.oldPasswordController, isPassword: true,),
                    heightSpace(10.h),
                    _buildLabelText('New password'),
                    heightSpace(5.h),
                    RoundedStyledTextField(labelText: '',controller: vm.newPassController, isPassword: true),
                    heightSpace(10.h),
                    _buildLabelText('Confirm password'),
                    heightSpace(5.h),
                    RoundedStyledTextField(labelText: '',controller: vm.confirmPassController, isPassword: true),
                    heightSpace(20.h),
                    vm.state==ViewState.Busy ? CircularProgressIndicator(
                      color: secondaryColor,
                    ):  StyledButton(function: (){
                      vm.updatePassword(context);
                    }, width: 164.w, fillColor: secondaryColor, child: reg14Text('UPDATE ', color: whiteColor),)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

  }

  _buildLabelText(text) {
    return RichText(
        text: TextSpan(
            text: '*',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.red),
            children: [
              TextSpan(
                  text: text,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor('#00173F'),
                  ))
            ]));
  }
}
