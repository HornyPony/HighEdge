import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomColors {
  static final Color inputGreyColor = Color(0xFFF2F2F2);
  static final Color errorFieldColor = Color(0xFFF2BFBF);
  static final Color darkGreyColor = Color(0xFF6F6F6F);
  static final Color lightGreyColor = Color(0xFFF4F4F4);
}

class Styling {
  static InputDecoration roundedWhiteInputDec(String hintText) {
    BorderRadius borderRadius = BorderRadius.circular(36.r);

    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      counterText: '',
      contentPadding: EdgeInsets.symmetric(
        vertical: 14.h,
        horizontal: 12.w,
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Color(0xFF707070),
        fontSize: 14.sp,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide.none,
      ),
    );
  }

  static InputDecoration lessRoundedGreyChatInputDec(String hintText) {
    return InputDecoration(
      fillColor: CustomColors.inputGreyColor,

      filled: true,
      //isDense: true,
      counterText: '',
      contentPadding: EdgeInsets.symmetric(
        vertical: 6.h,
        horizontal: 8.w,
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Color(0xFFC1C0C0),
        fontSize: 15.sp,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: CustomColors.inputGreyColor,
          width: 3.w,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: CustomColors.inputGreyColor,
          width: 3.w,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: CustomColors.inputGreyColor,
          width: 3.w,
        ),
      ),
      isDense: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: CustomColors.inputGreyColor,
          width: 3.w,
        ),
      ),
    );
  }
}
