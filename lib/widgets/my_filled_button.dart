import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:timmarkus/app_config/app_colors.dart';

class MyFilledButton extends StatelessWidget {
  @override
  String? txt="button";
  GestureTapCallback? ontap;
  Color ?color;
  Color? gradient1=AppColors.primaryColor;
  Color ?gradient2=AppColors.primaryColor;
  Color ?borderColor=AppColors.primaryColor;
  double? leftRightpadding;
  double ?borderRadius;
  double? width;
  double? txtFontSize;
  double? height;
  Color? txtColor;
  Color? splashColor;
  double? textPadding;

  MyFilledButton({
    this.txt,
    this.ontap,
    this.leftRightpadding,
    this.borderRadius,
    this.width,
    this.color,
    this.height,
    this.txtColor,
    this.txtFontSize,
    this.splashColor,
    this.textPadding
  });

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding:  EdgeInsets.only(left: leftRightpadding??0,  right:leftRightpadding?? 0),
        child: InkWell(
          splashColor: splashColor??Colors.white,
          borderRadius: BorderRadius.circular(borderRadius??15.sp),
          onTap: ontap,
          child: Ink(
            height: height??56.h,
            width: width,
            decoration: BoxDecoration(
              border: Border.all(color: color??borderColor!,),
              borderRadius: BorderRadius.circular(borderRadius??15.sp),
              gradient: LinearGradient(colors: [
               color?? gradient1!,
                color?? gradient2!,
              ]),
            ),
            child: Center(
              child: Padding(
                padding:  EdgeInsets.only(left:textPadding??0, right: textPadding??0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Container(
                        height: 15.sp,
                        width: 15.sp,
                      ),
                    ),
                    Text(
                      txt!,
                      style: TextStyle(
                        color: txtColor?? Colors.white,
                        fontSize: txtFontSize??18.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.9
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Container(
                        height: 15.sp,
                        width: 15.sp,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icon/forward_icon.png"),
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}
