import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/controller%20/home_screen_tab_controller.dart';
import 'package:timmarkus/widgets/my_text_field.dart';

class HomeScreenTab extends StatelessWidget {

  TextEditingController searchController = TextEditingController();
  HomeScreenTabController controller = HomeScreenTabController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 213.h,
                color: AppColors.primaryColor,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 22.w,right: 22.w,top: 42.h, bottom: 20.h),
                      child: MyTextField(
                        fillColor: Color(0xffEFEFEF),
                        height: 51.h,
                        controller: searchController,
                        hintText: "Search",
                        prefixIcon: 'assets/icon/search.png',
                        suffixIcon: 'assets/icon/camera_icon.png',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Container(
                        height: 80.h,
                        child: ListView.separated(
                          itemCount: controller.rowData.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return renderingRowData(controller.rowData[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 10.w,);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('You might want to try..', style: Styles.myTextStyle(fontSize: 17.sp,color: AppColors.blackColor, fontWeight: FontWeight.w600),),
                    SizedBox(height: 40.h,),
                    Container(
                      height: 125.h,
                      child: ListView.separated(
                        itemCount: controller.tryData.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return renderingTryData(controller.tryData[index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10.w,);
                        },
                      ),
                    ),
                    SizedBox(height: 40.h,),
                    Text('Recent Designs', style: Styles.myTextStyle(fontSize: 17.sp,color: AppColors.blackColor, fontWeight: FontWeight.w600),),
                    SizedBox(height: 20.h,),
                    Divider(color: AppColors.blackColor, thickness: 1.sp,),
                    SizedBox(height: 20.h,),
                    Container(
                      height: 100.h,
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
                    SizedBox(height: 40.h,),
                    Text('Advance Templates', style: Styles.myTextStyle(fontSize: 17.sp,color: AppColors.blackColor, fontWeight: FontWeight.w600),),
                    SizedBox(height: 20.h,),
                    Divider(color: AppColors.blackColor, thickness: 1.sp,),
                    SizedBox(height: 20.h,),
                    Container(
                      height: 300.h,
                      child: GridView.builder(
                        itemCount: controller.advancedData.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 30.h, crossAxisSpacing: 28.w),
                        itemBuilder: (context, index) {
                          return renderingAdvanceData(controller.advancedData[index]);
                        },
                      ),
                    ),
                    SizedBox(height: 40.h,),
                    Text('Website Templates', style: Styles.myTextStyle(fontSize: 17.sp,color: AppColors.blackColor, fontWeight: FontWeight.w600),),
                    SizedBox(height: 20.h,),
                    Divider(color: AppColors.blackColor, thickness: 1.sp,),
                    SizedBox(height: 20.h,),
                    Container(
                      height: 100.h,
                      child: ListView.separated(
                        itemCount: controller.websiteData.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return renderingWebsiteData(controller.websiteData[index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 25.w,);
                        },
                      ),
                    ),
                    SizedBox(height: 20.h,),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
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
      ),
    );
  }

  renderingRowData(Map data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60.sp,
          width: 60.sp,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(data['imagePath']),
            )
          ),
        ),
        SizedBox(height: 5.h,),
        Text(data['title'], style: Styles.myTextStyle(fontSize: 12.sp, color: Colors.white,),),
      ],
    );
  }

  renderingTryData(Map data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 90.sp,
          width: 130.sp,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(15.sp),
            image: DecorationImage(
              image: AssetImage(data['imagePath']),
            )
          ),
        ),
        SizedBox(height: 8.h,),
        Text(data['title'], style: Styles.myTextStyle(fontSize: 12.sp, color: AppColors.blackColor, fontWeight: FontWeight.w500),),
      ],
    );
  }

  renderingAdvanceData(Map data) {
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

  renderingWebsiteData(Map data) {
    return Container(
      height: 105.sp,
      width: 130.sp,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(15.sp),
      ),
      alignment: Alignment.center,
      child: Container(
        height: 60.sp,
        width: 110.sp,
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
    );
  }

}
