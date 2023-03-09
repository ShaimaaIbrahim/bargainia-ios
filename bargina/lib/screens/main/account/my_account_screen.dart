import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:bargina/widgets/styled_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/dropdown_widget.dart';
import '../../../widgets/rounded_textfield.dart';
import 'package:hexcolor/hexcolor.dart';
class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AccountViewModel>(
      onModelReady: (_){
        retryConnection((){
          _.getMyAccount(context);
        });
      },
      afterModelReady: (_){
        _.getMyAccount(context);
      },
      builder: (_, vm, child){
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar:AppBar(
            backgroundColor: primaryColor,
            title: reg20Text('My Account', color: whiteColor),
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
                    med20Text('Personal Data'),
                    Divider(color: secondaryColor, height: 10.h,),
                    heightSpace(10.h),
                    _buildLabelText('First Name'),
                    heightSpace(5.h),
                    RoundedStyledTextField(labelText: '', controller: vm.firstNameController,),
                    heightSpace(10.h),
                    _buildLabelText('Last Name'),
                    heightSpace(5.h),
                    RoundedStyledTextField(labelText: '',controller: vm.lastNameController,),
                    heightSpace(10.h),
                    _buildLabelText('Email'),
                    heightSpace(5.h),
                    RoundedStyledTextField(labelText: '',controller: vm.emailController,),
                    heightSpace(10.h),
                    _buildLabelText('Phone'),
                    heightSpace(5.h),
                    RoundedStyledTextField(labelText: '',controller: vm.phoneController,),
                    heightSpace(10.h),
                    // bold20Text('Change Password'),
                    // Divider(color: secondaryColor, height: 10.h,),
                    // heightSpace(10.h),
                    // _buildLabelText('Old Password'),
                    // heightSpace(5.h),
                    // RoundedStyledTextField(labelText: '',controller: vm.oldPasswordController,),
                    // heightSpace(10.h),
                    // _buildLabelText('New Password'),
                    // heightSpace(5.h),
                    // RoundedStyledTextField(labelText: '',controller: vm.newPassController,),
                    // heightSpace(10.h),
                    // bold20Text('Payment Info'),
                    // Divider(color: secondaryColor, height: 10.h,),
                    // heightSpace(10.h),
                    // _buildLabelText('Bank Name'),
                    // heightSpace(5.h),
                    // RoundedStyledTextField(labelText: ''),
                    // heightSpace(10.h),
                    // _buildLabelText('Account Number -SA'),
                    // heightSpace(5.h),
                    // RoundedStyledTextField(labelText: ''),
                    // heightSpace(10.h),
                    // _buildLabelText('Trip Name'),
                    // heightSpace(5.h),
                    // RoundedStyledTextField(labelText: ''),
                    // heightSpace(10.h),
                    // // bold20Text('Payment Address'),
                    // // Divider(color: secondaryColor, height: 10.h,),
                    // heightSpace(10.h),
                    // _buildLabelText('The Nearst Place is Next you'),
                    // heightSpace(5.h),
                    // RoundedStyledTextField(labelText: ''),
                    // heightSpace(10.h),
                    // _buildLabelText('Street Name'),
                    // heightSpace(5.h),
                    // RoundedStyledTextField(labelText: ''),
                    // heightSpace(10.h),
                    // _buildLabelText('Country'),
                    // heightSpace(5.h),
                    // DropDownWidget(),
                    // heightSpace(10.h),
                    // _buildLabelText('City'),
                    // heightSpace(5.h),
                    // DropDownWidget(),
                    // heightSpace(10.h),
                    // _buildLabelText('Region/State'),
                    // heightSpace(5.h),
                    // RoundedStyledTextField(labelText: ''),
                    // heightSpace(10.h),
                    // heightSpace(10.h),
                    // _buildLabelText('Postal Code'),
                    // heightSpace(5.h),
                    // RoundedStyledTextField(labelText: ''),
                    // heightSpace(10.h),
                    // bold20Text('New Letter'),
                    // Divider(color: secondaryColor, height: 10.h,),
                    // heightSpace(10.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     bold16Text('Subscribe'),
                    //     widthSpace(21.w),
                    //
                    //   ],
                    // ),
                   vm.state == ViewState.Busy ? CircularProgressIndicator(
                     color: secondaryColor,
                   ) : StyledButton(function: (){
                          vm.updateProfile(context);
                      },
                    width: 164.w, radius: true, fillColor: secondaryColor,  child: reg14Text('SAVE', color: whiteColor),)
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
