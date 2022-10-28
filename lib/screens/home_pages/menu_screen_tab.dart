import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/controller%20/bottom_bar_controller.dart';
import 'package:timmarkus/screens/auth_screen/update_profile_screen.dart';
import 'package:timmarkus/screens/static_data/about_faq_privacy.dart';
import 'package:timmarkus/screens/tab_bar_screen/tab_bar_sceen.dart';

class MenuScreenTab extends StatelessWidget {
  BottomBarController bottomBarController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                            width: 75.sp,

                          ),
                        ),
                        Text('Menu', style: Styles.myTextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700,),),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => TabBarScreen());
                          },
                          child: Container(
                            height: 27.sp,
                            width: 75.sp,
                            child: Center(
                              child: Text('Chat & Notification', style: Styles.myTextStyle(fontSize: 13.sp),)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(color: AppColors.blackColor, thickness: 1.sp,),
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {Get.to(() => UpdateProfileScreen());},
                      child: Row(
                        children: [
                          Container(
                            width: 50.sp,
                            height: 50.sp,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage('https://www.kindpng.com/picc/m/252-2524695_dummy-profile-image-jpg-hd-png-download.png'),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          SizedBox(width: 18.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hamza Munir", style: Styles.myTextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                              Text("Personal", style: Styles.myTextStyle(fontSize: 12.sp,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h,),
                    Divider(color: AppColors.blackColor, thickness: 1.sp,),
                    SizedBox(height: 15.h,),
                    renderingRowData(imagePath: "assets/menu_icon/templates.png", title: "Templates", onTap: () {bottomBarController.currentBNBIndex.value=0;}),
                    SizedBox(height: 15.h,),
                    renderingRowData(imagePath: "assets/menu_icon/project.png", title: "Projects", onTap: () {bottomBarController.currentBNBIndex.value=1;}),
                    SizedBox(height: 30.h,),
                    Text("Tools", style: Styles.myTextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),),
                    SizedBox(height: 20.h,),
                    renderingRowData(imagePath: "assets/menu_icon/brands.png", title: "Brands", onTap: () {bottomBarController.currentBNBIndex.value=0;}),
                    SizedBox(height: 20.h,),
                    renderingRowData(imagePath: "assets/menu_icon/content_planner.png", title: "Content Planner", onTap: () {bottomBarController.currentBNBIndex.value=0;}),
                    SizedBox(height: 20.h,),
                    renderingRowData(imagePath: "assets/menu_icon/discover_app.png", title: "Discover App", onTap: () {bottomBarController.currentBNBIndex.value=0;}),
                    SizedBox(height: 20.h,),
                    renderingRowData(imagePath: "assets/menu_icon/smart_mockups.png", title: "Smartmockups", onTap: () {bottomBarController.currentBNBIndex.value=0;}),
                    SizedBox(height: 15.h,),
                    Divider(color: AppColors.blackColor, thickness: 1.sp,),
                    SizedBox(height: 15.h,),
                    renderingRowData(imagePath: "assets/menu_icon/team.png", title: "Create a team", onTap: () {}),
                    SizedBox(height: 20.h,),
                    renderingRowData(imagePath: "assets/icon/privacy_policy.png", title: "Privacy Policy", onTap: () { Get.to(() => AboutFaqsPrivacyScreen(type: "Privacy Policy",)); }),
                    SizedBox(height: 20.h,),
                    renderingRowData(imagePath: "assets/icon/faqs.png", title: "Frequently Asked Questions", onTap: () { Get.to(() => AboutFaqsPrivacyScreen(type: "Frequently Asked Questions",)); }),
                    SizedBox(height: 20.h,),
                    renderingRowData(imagePath: "assets/icon/about_us.png", title: "About Us", onTap: () { Get.to(() => AboutFaqsPrivacyScreen(type: "About Us",)); }),
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

  renderingRowData({String? imagePath, String? title, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 25.sp,
            width: 25.sp,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath!),
                fit: BoxFit.cover
              )
            ),
          ),
          SizedBox(width: 8.h,),
          Text(title!, style: Styles.myTextStyle(fontSize: 14.sp),)
        ],
      ),
    );
  }
}
