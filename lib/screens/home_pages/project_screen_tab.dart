import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/controller%20/home_screen_tab_controller.dart';

class ProjectScreenTab extends StatelessWidget {
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
                      Row(
                        children: [
                          GestureDetector(
                            // onTap: () {Get.back();},
                            child: Container(
                              height: 27.sp,
                              width: 26.sp,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/icon/search.png"),
                                )
                              ),
                            ),
                          ),
                          SizedBox(width: 7.w,),
                          GestureDetector(
                            // onTap: () {Get.back();},
                            child: Container(
                              height: 27.sp,
                              width: 26.sp,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/icon/more.png"),
                                )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: AppColors.blackColor, thickness: 1.sp,),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 110.h,
                    child: ListView.separated(
                      itemCount: controller.recentData.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return renderingRecentData(controller.recentData[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 25.w,);
                      },
                    ),
                  ),
                  SizedBox(height: 35.h,),
                  Text("Folders", style: Styles.myTextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),),
                  SizedBox(height: 20.h,),
                  renderBox(imagePath: "assets/project_tab_icon/purchased.png", title: "Purchased"),
                  SizedBox(height: 20.h,),
                  renderBox(imagePath: "assets/project_tab_icon/starred.png", title: "Starred"),
                  SizedBox(height: 20.h,),
                  renderBox(imagePath: "assets/project_tab_icon/upload.png", title: "Upload"),
                  SizedBox(height: 19.h,),
                  Divider(color: AppColors.blackColor, thickness: 1.sp,),
                  SizedBox(height: 20.h,),
                  Text("Designs", style: Styles.myTextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),),
                ],
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
