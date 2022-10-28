import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:timmarkus/app_config/app_colors.dart';

class Styles{

  static TextStyle textFieldlabelTextStyle() {
   return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.textFieldColor
    );
  }

  static TextStyle introBoldTextStyle() {
    return TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.greyColor
    );
  }

  static TextStyle myTextStyle({double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      fontSize: fontSize??15.sp,
      fontWeight: fontWeight??FontWeight.w400,
      color: color??AppColors.blackColor,
    );
  }

}