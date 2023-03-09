import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';
import '../utils/texts.dart';

class RoundedStyledTextField extends StatelessWidget {
  final keyboardType;
  final bool? isPassword;
  final hint;
  final controller;
  final validator;
  final textAlign;
  final Color? fillColor;
  final String labelText;
  final String? suffixText;
  final bool? readOnly;
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
  final double? height;

  const RoundedStyledTextField({
    required this.labelText,
    this.readOnly,
    this.suffixText,
    this.height,
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
    this.suffixWidget,
    this.onIconPressed,
    this.maxLines,
    this.editable = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 35.w,
      width: width,
      child: TextFormField(
        readOnly: readOnly ?? false,
        textAlign: textAlign,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword ?? false,
        style: textFieldTextStyle,
        onChanged: (value) {
          onChange!(value);
        },
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: borderPadding ?? 5.w, vertical :5.h),
          hintText: hint,
          enabled: editable!,
          filled: true,
          fillColor: Colors.white,
          hintStyle: hintStyle == null ? smallStyle : hintStyle,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: borderRadius == null
                ? BorderRadius.circular(8.r)
                : borderRadius!,
            borderSide: BorderSide(
              color: greyColor,
            ),
          ),
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
        validator: validator,
      ),
    );
  }
}
