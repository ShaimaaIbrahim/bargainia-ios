import 'package:bargina/screens/auth/viewmodel/auth_view_model.dart';
import 'package:bargina/screens/main/BaseScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../Locator.dart';
import '../../routes/RoutesNames.dart';
import '../../services/navigation_service.dart';
import '../../widgets/styled_text_field.dart';
import '../../utils/colors.dart';
class VerificationScreen extends StatelessWidget {
  final phone;
  const VerificationScreen({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AuthViewModel>(
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
                        //     child: Image.asset('assets/images/logo.png', height: 45.h, width: 160.w,),
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
                        child: _buildVerificationWidget(context, vm)
                    )
                  ],
                )
            )
        );
      },
    );

  }
  _buildVerificationWidget(BuildContext context, AuthViewModel viewModel){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          color: whiteColor
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 14.h, bottom: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            bold30Text('Verification'),
            Container(
                width: MediaQuery.of(context).size.width,
                child: reg14Text('A 6 - Digit PIN has been sent to your email address, enter it below to continue', color: HexColor('#929292'))),
            heightSpace(60.h),
            _builsPinCodeWidget(context, viewModel),
            heightSpace(60.h),
            StyledButton(function: (){
            }, fillColor: secondaryColor,
              radius: true,
              child: reg14Text('Continue', color: whiteColor),
            )
          ],
        ),
      ),
    );
  }

  _builsPinCodeWidget(BuildContext context, AuthViewModel viewModel) {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: TextStyle(
        color: Colors.grey[600],
        fontWeight: FontWeight.bold,
      ),
      length: 4,
      obscureText: true,
      obscuringCharacter: '*',
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      validator: (v) {
        if (v!.length < 3) {
          return "I'm from validator";
        } else {
          return null;
        }
      },
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        inactiveFillColor: whiteColor,
        errorBorderColor: Colors.grey[600],
        fieldHeight: 50,
        fieldWidth: 60,
      ),
     // cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      keyboardType: TextInputType.number,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.black12,
          blurRadius: 10,
        )
      ],
      onCompleted: (code) {
         viewModel.verifyCode(context, phone, code);
      },
      onChanged: (value) {
        debugPrint(value);
      },
      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        return true;
      },
    );
  }
}
