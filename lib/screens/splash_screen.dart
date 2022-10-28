import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/screens/intro_screen/intro_screen.dart';

class SplashScreen extends StatelessWidget {
  var oneSec = const Duration(seconds: 2);
  @override
  Widget build(BuildContext context) {
    navigate();
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: Get.width,),
          SizedBox(
            width: 256.w,
            height: 259.h,
            child: Image.asset("assets/image/logo.png",)
          ),
        ],
      ),
    );
  }


  navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.off(()=> IntroScreen(), transition: Transition.rightToLeft);
  }
}
