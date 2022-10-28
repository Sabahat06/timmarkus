import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/screens/auth_screen/password_verfication_screen.dart';
import 'package:timmarkus/widgets/my_filled_button.dart';
import 'package:timmarkus/widgets/my_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {Get.back();},
                    child: Container(
                      height: 27.sp,
                      width: 26.sp,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icon/back_icon.png"),
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22.h),
                Align(alignment: Alignment.centerLeft, child: Text("Reset Password", style: Styles.myTextStyle(color: AppColors.blackColor, fontSize: 24.sp, fontWeight: FontWeight.w500),)),
                SizedBox(height: 15.h,),
                Align(alignment: Alignment.centerLeft, child: Text("Please enter your Phone no. to \nrequest a password reset", style: Styles.myTextStyle(),)),
                SizedBox(height: 26.h,),
                MyTextField(
                  height: 55.h,
                  controller: phoneController,
                  hintText: 'Phone No.',
                  prefixIcon: 'assets/icon/phone.png',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20.h,),
                MyFilledButton(
                  width: 271.w,
                  height: 55.h,
                  txt: "SEND",
                  txtFontSize: 16,
                  ontap: () {
                    Get.to(() => PasswordVerficationScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
