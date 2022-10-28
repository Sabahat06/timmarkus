import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';

class MyTextField extends StatelessWidget {
  TextEditingController? controller;
  String? label;
  bool? obsecureText =false;
  dynamic suffixIcon;
  GestureTapCallback? onSuffixIconTap;
  dynamic prefixIcon;
  final ValueChanged<String>? onChanged;
  String? Function(String?)? validator;
  Function? onEditingComplete;
  GestureTapCallback? onTap;
  bool? enabled=true;
  int? maxLines;
  String? hintText;
  TextInputType? keyboardType;
  bool? autoFocus;
  double? height;
  double? width;
  int? maxLength;
  FocusNode? focusNode;
  bool? phoneNumber=false;
  bool? disableborder=false;
  double?borderRadiusCircular;
  Color?fillColor;
  Color? borderColor;
  Color? labelTextColor;
  Color? textInputColor;
  Color? cursorColor;
  bool? changeTextFieldTextColor = false;

  ///Constructor
  MyTextField({
    @required this.controller,
    @required this.label,
    this.obsecureText,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.onEditingComplete,
    this.enabled,
    this.onTap,
    this.maxLines,
    this.hintText,
    this.keyboardType,
    this.autoFocus,
    this.height,
    this.width,
    this.maxLength,
    this.focusNode,
    this.phoneNumber,
    this.disableborder,
    this.borderRadiusCircular,
    this.fillColor,
    this.borderColor,
    this.labelTextColor,
    this.validator,
    this.textInputColor,
    this.cursorColor,
    this.onSuffixIconTap,
    this.changeTextFieldTextColor
  });

  @override
  Widget build(BuildContext context) {
    bool _passwordVisible = false;
    return Container(
      height: height??56.h,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.w),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          validator: validator,
          focusNode: focusNode,
          maxLength: maxLength,
          autofocus: autoFocus??false,
          keyboardType: keyboardType,
          maxLines: maxLines??1,
          enabled: enabled,
          onTap: onTap,
          onEditingComplete: (){ onEditingComplete!(); },
          expands: false,
          onChanged: onChanged,
          controller: controller,
          obscureText: obsecureText??false,
          cursorColor: cursorColor??AppColors.primaryColor,
          style: changeTextFieldTextColor !=null ? Styles.myTextStyle(color: AppColors.blackColor, fontSize: 16.sp, fontWeight: FontWeight.w400) : Styles.textFieldlabelTextStyle(),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintText: hintText,
            suffixIcon: suffixIcon == null
              ? const SizedBox()
              : GestureDetector(
                onTap: onSuffixIconTap,
                child: Container(
                  width: 19.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(suffixIcon),
                    )
                  ),
                ),
              ),
            prefixIcon: prefixIcon == null
              ? const SizedBox()
              : Container(
                width: 19.w,
                height: 15.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(prefixIcon),
                  )
                ),
            ),
            fillColor: fillColor??Colors.white,
            filled: true,
            focusColor: AppColors.primaryColor,
            hoverColor: AppColors.greyColor,
            labelText: label,
            hintStyle: changeTextFieldTextColor !=null ? Styles.myTextStyle(color: AppColors.blackColor, fontSize: 16.sp, fontWeight: FontWeight.w400) : Styles.textFieldlabelTextStyle(),
            labelStyle: Styles.textFieldlabelTextStyle(),
            errorStyle: TextStyle(color: Colors.red, fontSize: 15.sp,),
            // contentPadding: EdgeInsets.all(20.0),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: changeTextFieldTextColor !=null ? Colors.transparent :  AppColors.greyColor,),
              borderRadius: BorderRadius.all(Radius.circular(12.sp)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: changeTextFieldTextColor !=null ? Colors.transparent :  AppColors.greyColor,),
              borderRadius: BorderRadius.all(Radius.circular(12.sp)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: changeTextFieldTextColor !=null ? Colors.transparent : AppColors.primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(12.sp)),
            ),
            // border:  OutlineInputBorder(
            //   borderSide: BorderSide(color: borderColor??Colors.black12,),
            //   borderRadius: BorderRadius.all(Radius.circular(15.sp)),
            // ),
          )
        ),
      ),
    );
  }
}
