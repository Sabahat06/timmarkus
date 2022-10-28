import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/screens/auth_screen/reset_password.dart';
import 'package:timmarkus/screens/auth_screen/sign_up_screen.dart';
import 'package:timmarkus/screens/home_pages/homepage.dart';
import 'package:timmarkus/widgets/my_filled_button.dart';
import 'package:timmarkus/widgets/my_text_field.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool passwordVisibility = false.obs;
  RxBool isRememberMe = false.obs;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 90.h),
                Align(alignment: Alignment.centerLeft, child: Text("Sign In", style: Styles.myTextStyle(color: AppColors.blackColor, fontSize: 24.sp, fontWeight: FontWeight.w400),)),
                SizedBox(height: 19.h),
                MyTextField(
                  height: 55.h,
                  fillColor: Colors.white,
                  controller: emailController,
                  hintText: 'Email',
                  prefixIcon: 'assets/icon/people.png',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20.h,),
                Obx(
                  () => MyTextField(
                    height: 55.h,
                    fillColor: Colors.white,
                    controller: passwordController,
                    hintText: 'Password',
                    obsecureText: passwordVisibility.value ? false : true,
                    prefixIcon: 'assets/icon/password.png',
                    suffixIcon: passwordVisibility.value ? 'assets/icon/password_not_visible.png' : 'assets/icon/password_visible.png',
                    onSuffixIconTap: () {
                      passwordVisibility.value = !passwordVisibility.value;
                    },
                  ),
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {isRememberMe.value = !isRememberMe.value;},
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 19.w,
                              height: 19.h,
                              decoration: BoxDecoration(
                                border: Border.all(width: 2.sp, color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(6.sp),
                                color: isRememberMe.value ? AppColors.primaryColor : Colors.transparent
                              ),
                              child: Center(
                                child: Icon(Icons.done, color: Colors.white, size: 15.sp,),
                              ),
                            ),
                            SizedBox(width: 6.w,),
                            Text('Remember me', style: Styles.myTextStyle(),),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {Get.to(() => ResetPasswordScreen());},
                      child: Text("Forgot Password?", style: Styles.myTextStyle(),)
                    ),
                  ],
                ),
                SizedBox(height: 35.h,),
                MyFilledButton(
                  width: 271.w,
                  height: 55.h,
                  txt: "SIGN IN",
                  txtFontSize: 16,
                  ontap: () {
                    Get.to(() => HomePage());
                  },
                ),
                SizedBox(height: 200.h,),
                Text("OR", style: Styles.myTextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Color(0xff9D9898)),),
                SizedBox(height: 30.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ", style: Styles.myTextStyle(),),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignUpScreen());
                      },
                      child: Text("Sign Up", style: Styles.myTextStyle(color: AppColors.primaryColor),)
                    )
                  ],
                ),
                SizedBox(height: 50.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
