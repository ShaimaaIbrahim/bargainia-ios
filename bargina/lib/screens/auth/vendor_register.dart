import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/screens/auth/viewmodel/auth_view_model.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Locator.dart';
import '../../routes/RoutesNames.dart';
import '../../services/navigation_service.dart';
import '../../widgets/styled_text_field.dart';

class VendorRegisterScreen extends StatelessWidget {
  const VendorRegisterScreen({Key? key}) : super(key: key);

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
                          padding: EdgeInsets.only(top: 20.h,),
                          child:  Image.asset('assets/images/logo.png', height: 200.h, width:MediaQuery.of(context).size.width)
                      ),
                    ),
                    // Container(
                    //    height: 280.h,
                    //   width: MediaQuery.of(context).size.width,
                    //   color: primaryColor,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //       top: 68.h,
                    //     ),
                    //     child: Image.asset(
                    //       'assets/images/logo.png',
                    //       height: 45.h,
                    //       width: 160.w,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Positioned(
                    top: 0.h,
                    right: 0.w,
                    child: Image.asset("assets/icons/next.png", color: Colors.white, height: 40.h, width: 40.w,).onTap((){
                      locator<NavigationService>().goBack();
                    })),
                Positioned(
                    top: 126.h,
                    right: 16.w,
                    left: 16.w,
                    bottom: 0.h,
                    child: _buildRegisterWidget(context, vm))
              ],
            )));
      },
    );
  }

  _buildRegisterWidget(BuildContext context, AuthViewModel viewModel) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.r)),
            color: whiteColor),
        child: Padding(
          padding:
              EdgeInsets.only(left: 16.w, right: 16.w, top: 14.h, bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bold24Text('Registering a seller contract'),
              reg20Text('With Bargainia', color: HexColor('#929292')),
              heightSpace(30.h),
              StyledTextField(
                labelText: 'Display Name',
                controller: viewModel.firstNameController,
              ),
              heightSpace(20.h),
              StyledTextField(
                labelText: 'Legal Name',
                controller: viewModel.lastNameController,
              ),
              heightSpace(20.h),
              StyledTextField(
                labelText: 'Phone',
                controller: viewModel.phoneController,
                keyboardType: TextInputType.phone,
              ),
              heightSpace(20.h),
              StyledTextField(
                labelText: 'Commercial Registration number',
                controller: viewModel.commircalNumberController,
                keyboardType: TextInputType.phone,
              ),
              heightSpace(20.h),
              StyledTextField(
                labelText: 'VAT registration number',
                controller: viewModel.vatNumberController,
                keyboardType: TextInputType.phone,
              ),
              heightSpace(20.h),
              StyledTextField(
                labelText: 'Bank Iban Number',
                controller: viewModel.bankNoController,
              ),
              heightSpace(20.h),
              bold14Text('Commercial Registration image',
                      color: Colors.grey[500])
                  .onTap(() {
                viewModel.showChoiceDialog(context, 1);
              }),
              heightSpace(20.h),
              bold14Text('VAT registration image', color: Colors.grey[500])
                  .onTap(() {
                viewModel.showChoiceDialog(context, 2);
              }),
              heightSpace(20.h),
            viewModel.state ==ViewState.Busy? Center(
              child: CircularProgressIndicator(color: primaryColor,),
            ):  StyledButton(
                radius: true,
                function: () {
                  viewModel.vendorSignUp(context);
                  // locator<NavigationService>().navigateTo(RouteName.VendorRegisterContract);
                },
                child: reg14Text('Vendor Register', color: whiteColor),
                fillColor: secondaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
