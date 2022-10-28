import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/controller%20/bottom_bar_controller.dart';
import 'package:timmarkus/screens/home_pages/homepage.dart';
import 'package:timmarkus/widgets/my_filled_button.dart';
import 'package:timmarkus/widgets/my_text_field.dart';

class PaymentScreen extends StatelessWidget {
  BottomBarController bottomBarController = Get.find();

  TextEditingController creditCardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController validTillController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  RxBool isVisaSelected = false.obs;
  RxBool isMasterCardSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 65.h,
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
                        Text('Premium Version', style: Styles.myTextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700,),),
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
              SizedBox(height: 30.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 20.h),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              isVisaSelected.value = !isVisaSelected.value;
                              isMasterCardSelected.value = false;
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 20.sp,
                                  width: 20.sp,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.profileTextFieldColor
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 10.sp,
                                      width: 10.sp,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isVisaSelected.value ? AppColors.blackColor : Colors.transparent
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.h),
                                Image.asset(
                                  'assets/payment_image/payment_image_2.png',
                                  width: 105.w,
                                  height: 60.h,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              isMasterCardSelected.value = !isMasterCardSelected.value;
                              isVisaSelected.value = false;
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 20.sp,
                                  width: 20.sp,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.profileTextFieldColor
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 10.sp,
                                      width: 10.sp,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isMasterCardSelected.value ? AppColors.blackColor : Colors.transparent
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.h),
                                Image.asset(
                                  'assets/payment_image/payment_image_1.png',
                                  width: 105.w,
                                  height: 60.h,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),

                    getText('Credit Card Number'),
                    SizedBox(height: 10.h),
                    MyTextField(
                      height: 55.h,
                      changeTextFieldTextColor: true,
                      fillColor: AppColors.profileTextFieldColor,
                      controller: creditCardNumberController,
                    ),
                    SizedBox(height: 5.h,),

                    getText('Card Holder Name'),
                    SizedBox(height: 10.h),
                    MyTextField(
                      height: 55.h,
                      changeTextFieldTextColor: true,
                      fillColor: AppColors.profileTextFieldColor,
                      controller: cardHolderNameController,
                    ),
                    SizedBox(height: 5.h,),

                    getText('Valid till'),
                    SizedBox(height: 10.h),
                    MyTextField(
                      height: 55.h,
                      changeTextFieldTextColor: true,
                      fillColor: AppColors.profileTextFieldColor,
                      controller: validTillController,
                    ),
                    SizedBox(height: 5.h,),

                    getText('CVV (3-digit card verification number)'),
                    SizedBox(height: 10.h),
                    MyTextField(
                      height: 55.h,
                      changeTextFieldTextColor: true,
                      fillColor: AppColors.profileTextFieldColor,
                      controller: cvvController,
                    ),

                    SizedBox(height: 20.h,),
                    Align(
                      alignment: Alignment.center,
                      child: MyFilledButton(
                        width: 200.w,
                        height: 40.h,
                        txt: "SAVE",
                        txtFontSize: 16,
                        ontap: () {
                          bottomBarController.currentBNBIndex.value = 0;
                          Get.back();
                        },
                      ),
                    ),
                    SizedBox(height: 10.h,),
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
