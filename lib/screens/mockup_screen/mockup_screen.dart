import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/controller%20/home_screen_tab_controller.dart';

class MockupScreen extends StatelessWidget {
  HomeScreenTabController controller = HomeScreenTabController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      Text('Projects', style: Styles.myTextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700,),),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            // onTap: () {Get.back();},
                            child: Container(
                              height: 27.sp,
                              width: 26.sp,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/icon/arrow_down.png"),
                                )
                              ),
                            ),
                          ),
                          SizedBox(width: 7.w,),
                          Text('Save', style: Styles.myTextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400,),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: AppColors.blackColor, thickness: 1.sp,),
            SizedBox(height: 100.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Container(
                height: 295.h,
                width: double.infinity,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 60.sp,
                height: 60.sp,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: const Center(
                  child: Icon(Icons.add, color: Colors.white,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  renderingRecentData(Map data) {
    return Container(
      height: 105.sp,
      width: 130.sp,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15.sp),
          image: DecorationImage(
            image: AssetImage(data['imagePath']),
          )
      ),
    );
  }

  renderBox({String? imagePath, String? title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              color: AppColors.primaryColor,
              image: DecorationImage(
                image: AssetImage(imagePath!),
              )
          ),
        ),
        SizedBox(height: 8.h,),
        Text(title!, style: Styles.myTextStyle(fontSize: 15.sp),)
      ],
    );
  }
}
