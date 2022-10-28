import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/controller%20/bottom_bar_controller.dart';
import 'package:timmarkus/screens/home_pages/homepage.dart';
import 'package:timmarkus/widgets/my_filled_button.dart';
import 'package:timmarkus/widgets/my_text_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  BottomBarController bottomBarController = Get.find();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  UpdateProfileScreen() {
    emailController = TextEditingController(text: 'hamza@gmail.com');
    phoneController = TextEditingController(text: '+92 123 1234567');
    dobController = TextEditingController(text: '06-06-2022');
    firstNameController = TextEditingController(text: 'Raja Hamza');
    lastNameController = TextEditingController(text: 'Munir');
    addressController = TextEditingController(text: 'Thanda Pani');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50.h,
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
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
                        Text('Edit Profile', style: Styles.myTextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700,),),
                        Container(
                          height: 27.sp,
                          width: 26.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(color: AppColors.blackColor, thickness: 1.sp,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: EdgeInsets.only(left: 115.w, right: 115.w),
                      child: Container(
                        width: 140.sp,
                        height: 140.sp,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage('https://www.kindpng.com/picc/m/252-2524695_dummy-profile-image-jpg-hd-png-download.png'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),

                    getText('First Name'),
                    SizedBox(height: 5.h),
                    MyTextField(
                      height: 55.h,
                      changeTextFieldTextColor: true,
                      fillColor: AppColors.profileTextFieldColor,
                      controller: firstNameController,
                      hintText: 'Full Name',
                    ),
                    SizedBox(height: 5.h,),

                    getText('Last Name'),
                    SizedBox(height: 5.h),
                    MyTextField(
                      height: 55.h,
                      changeTextFieldTextColor: true,
                      fillColor: AppColors.profileTextFieldColor,
                      controller: lastNameController,
                      hintText: 'Last Name',
                    ),
                    SizedBox(height: 5.h,),

                    getText('Address'),
                    SizedBox(height: 5.h),
                    MyTextField(
                      height: 55.h,
                      changeTextFieldTextColor: true,
                      fillColor: AppColors.profileTextFieldColor,
                      controller: addressController,
                      hintText: 'Address',
                    ),
                    SizedBox(height: 5.h,),

                    getText('Date of Birth'),
                    SizedBox(height: 5.h),
                    MyTextField(
                      height: 55.h,
                      changeTextFieldTextColor: true,
                      fillColor: AppColors.profileTextFieldColor,
                      controller: dobController,
                      hintText: 'Date of Birth',
                    ),
                    SizedBox(height: 5.h,),

                    getText('Email Address'),
                    SizedBox(height: 5.h),
                    MyTextField(
                      height: 55.h,
                      changeTextFieldTextColor: true,
                      fillColor: AppColors.profileTextFieldColor,
                      controller: emailController,
                      hintText: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 5.h,),

                    getText('Phone Number'),
                    SizedBox(height: 5.h),
                    MyTextField(
                      height: 55.h,
                      changeTextFieldTextColor: true,
                      fillColor: AppColors.profileTextFieldColor,
                      controller: phoneController,
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10.h,),
                    Align(
                      alignment: Alignment.center,
                      child: MyFilledButton(
                        width: 200.w,
                        height: 40.h,
                        txt: "UPDATE",
                        txtFontSize: 16,
                        ontap: () {
                          bottomBarController.currentBNBIndex.value = 0;
                          Get.off(() => HomePage());
                        },
                      ),
                    ),
                    SizedBox(height: 5.h,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getText(String text) {
    return Text(text, style: Styles.myTextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),);
  }
}
