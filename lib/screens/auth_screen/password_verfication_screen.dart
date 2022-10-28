import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/screens/home_pages/homepage.dart';
import 'package:timmarkus/widgets/my_filled_button.dart';
import 'package:timmarkus/widgets/my_text_field.dart';

class PasswordVerficationScreen extends StatelessWidget {
  String code = '';
  TextEditingController phoneController = TextEditingController();

  TextEditingController firstValue = TextEditingController();
  TextEditingController secondValue = TextEditingController();
  TextEditingController thirdValue = TextEditingController();
  TextEditingController fourthValue = TextEditingController();

  FocusNode firstValueFocusNode = FocusNode();
  FocusNode secondValueFocusNode = FocusNode();
  FocusNode thirdValueFocusNode = FocusNode();
  FocusNode fourthValueFocusNode = FocusNode();
  FocusNode firstValueFocusNodeListener = FocusNode();
  FocusNode secondValueFocusNodeListener = FocusNode();
  FocusNode thirdValueFocusNodeListener = FocusNode();
  FocusNode fourthValueFocusNodeListener = FocusNode();

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
                Align(alignment: Alignment.centerLeft, child: Text("Verification", style: Styles.myTextStyle(color: AppColors.blackColor, fontSize: 24.sp, fontWeight: FontWeight.w500),)),
                SizedBox(height: 15.h,),
                Align(alignment: Alignment.centerLeft, child: Text("We've send you the verification\ncode on +923121531796", style: Styles.myTextStyle(),)),
                SizedBox(height: 26.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50.sp,
                        width: 50.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(color: AppColors.greyColor, width: 1)
                        ),
                        child: Center(
                          child: RawKeyboardListener(
                            focusNode: firstValueFocusNodeListener,
                            onKey: (RawKeyEvent event) {
                              print(event.data.logicalKey.keyId);
                              if (event.runtimeType == RawKeyDownEvent && (event.logicalKey.keyId == 4294967304)) {
                                firstValue.clear();
                              }
                            },
                            child: TextFormField(
                              controller: firstValue,
                              focusNode: firstValueFocusNode,
                              enableInteractiveSelection: false,
                              cursorColor: AppColors.primaryColor,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  secondValueFocusNode.requestFocus();
                                }
                              },
                              style: TextStyle(color: Colors.black, fontSize: 17.sp),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                counterText: "",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50.sp,
                        width: 50.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(color: AppColors.greyColor, width: 1)
                        ),
                        child: Center(
                          child: RawKeyboardListener(
                            focusNode: secondValueFocusNodeListener,
                            onKey: (RawKeyEvent event) {
                              print(event.data.logicalKey.keyId);
                              if (event.runtimeType == RawKeyDownEvent &&
                                  (event.logicalKey.keyId == 4294967304)) {
                                secondValue.clear();
                                if (secondValue.text.length == 0) {
                                  firstValueFocusNode.requestFocus();
                                }
                              }
                            },
                            child: TextFormField(
                              focusNode: secondValueFocusNode,
                              controller: secondValue,
                              enableInteractiveSelection: false,
                              cursorColor: AppColors.primaryColor,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  thirdValueFocusNode.requestFocus();
                                }
                              },
                              style: TextStyle(color: Colors.black, fontSize: 17.sp),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                counterText: "",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50.sp,
                        width: 50.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(color: AppColors.greyColor, width: 1)
                        ),
                        child: Center(
                          child: RawKeyboardListener(
                            focusNode: thirdValueFocusNodeListener,
                            onKey: (RawKeyEvent event) {
                              print(event.data.logicalKey.keyId);
                              if (event.runtimeType == RawKeyDownEvent &&
                                  (event.logicalKey.keyId == 4294967304)) {
                                thirdValue.clear();
                                if (thirdValue.text.length == 0) {
                                  secondValueFocusNode.requestFocus();
                                }
                              }
                            },
                            child: TextFormField(
                              controller: thirdValue,
                              focusNode: thirdValueFocusNode,
                              enableInteractiveSelection: false,
                              cursorColor: AppColors.primaryColor,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  fourthValueFocusNode.requestFocus();
                                }
                              },
                              style:
                              TextStyle(color: Colors.black, fontSize: 17.sp),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                counterText: "",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50.sp,
                        width: 50.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(color: AppColors.greyColor, width: 1)
                        ),
                        child: Center(
                          child: RawKeyboardListener(
                            focusNode: fourthValueFocusNodeListener,
                            onKey: (RawKeyEvent event) {
                              print(event.data.logicalKey.keyId);
                              if (event.runtimeType == RawKeyDownEvent &&
                                  (event.logicalKey.keyId == 4294967304)) {
                                fourthValue.clear();
                                if (fourthValue.text.length == 0) {
                                  thirdValueFocusNode.requestFocus();
                                }
                              }
                            },
                            child: TextFormField(
                              controller: fourthValue,
                              focusNode: fourthValueFocusNode,
                              enableInteractiveSelection: false,
                              cursorColor: AppColors.primaryColor,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              style:
                              TextStyle(color: Colors.black, fontSize: 17.sp),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                counterText: "",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                MyFilledButton(
                  width: 271.w,
                  height: 55.h,
                  txt: "CONTINUE",
                  txtFontSize: 16,
                  ontap: () {
                    code = "${firstValue}${secondValue}${thirdValue}${fourthValue}";
                    Get.to(() => HomePage());
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
