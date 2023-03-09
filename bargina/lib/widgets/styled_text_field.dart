import 'package:bargina/utils/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class StyledTextField extends StatelessWidget {
  final keyboardType;
  final bool? isPassword;
  final hint;
  final controller;
  final validator;
  final textAlign;
  final Color? fillColor;
  final String labelText;

  // final double? borderRadius;
  final double? borderPadding;
  final Widget? suffixWidget;
  final Function? onIconPressed;
  final Function? onChange;
  final hintStyle;
  final int? maxLines;
  final bool? editable;
  final BorderRadius? borderRadius;
  final double? width;

  const StyledTextField({
    required this.labelText,
    this.suffixWidget,
    this.width,
    this.hintStyle,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.hint,
    this.validator,
    this.onChange,
    this.borderPadding,
    this.textAlign = TextAlign.start,
    this.fillColor,
    this.borderRadius,
    this.onIconPressed,
    this.maxLines,
    this.editable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.w,
      child: TextFormField(
        textAlign: textAlign,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword ?? false,
        style: textFieldTextStyle,
        onChanged: (value) {
          if (value.length > 100) {}
        },
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: borderPadding ?? 5.w, vertical: 5.h),
          hintText: hint,
          enabled: editable!,
          filled: true,
          fillColor: Colors.white,
          hintStyle: hintStyle == null ? smallStyle : hintStyle,
          labelText: labelText,
          // border: OutlineInputBorder(
          //   borderRadius: borderRadius == null
          //       ? BorderRadius.circular(8.r)
          //       : borderRadius!,
          //   borderSide: BorderSide(
          //     color: greyColor,
          //   ),
          // ),
          suffixIcon: Container(
            padding: EdgeInsets.all(5.w),
            child: suffixWidget ?? bold11Text(''),
          ),
          //      prefixIcon: suffixWidget,
          // prefixIconConstraints: BoxConstraints(
          //        maxHeight: 40.h,
          //        maxWidth: 20.w,
          //      ),
        ),
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Can\'t be empty';
          }
          if (text.length < 4) {
            return 'Too short';
          }
          return null;
        },
      ),
    );
  }
}
