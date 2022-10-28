import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/screens/payment_screen/payment_screen.dart';
import 'package:timmarkus/widgets/my_filled_button.dart';

class ProScreenTab extends StatelessWidget {
  const ProScreenTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
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
            SizedBox(height: 100.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                width: double.infinity,
                height: 400.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15.sp)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h,),
                    Text("Business Plan", style: Styles.myTextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700),),
                    SizedBox(height: 25.h,),
                    Text("Remove all the advertisement from your screens", style: Styles.myTextStyle(fontSize: 16.sp), textAlign: TextAlign.center,),
                    SizedBox(height: 25.h,),
                    Text("Activate now for ", style: Styles.myTextStyle(fontSize: 17.sp),),
                    SizedBox(height: 15.h,),
                    Text("5€", style: Styles.myTextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700),),
                    SizedBox(height: 20.h,),
                    MyFilledButton(
                      height: 45.h,
                      color: Colors.white,
                      borderRadius: 10.sp,
                      txtColor: AppColors.blackColor,
                      txt: "Active Now",
                      width: 160.w,
                      ontap: () {
                        Get.to(() => PaymentScreen());
                      },
                    ),
                    SizedBox(height: 15.h,),
                    MyFilledButton(
                      height: 45.h,
                      color: Colors.white,
                      borderRadius: 10.sp,
                      txtColor: AppColors.blackColor,
                      txt: "Details",
                      width: 180.w,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
