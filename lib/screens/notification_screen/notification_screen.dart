import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/controller%20/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationController notificationController = NotificationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                children: [
                  Text("New", style: Styles.myTextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),),
                  SizedBox(width: 15.w,),
                  Container(
                    width: 35.sp,
                    height: 35.sp,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: Center(child: Text("2", style: Styles.myTextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.h,),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notificationController.newNotification.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return renderingNotifications(notificationController.newNotification[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.h,);
              },
            ),
            SizedBox(height: 30.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                children: [
                  Text("Earlier", style: Styles.myTextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),),
                  SizedBox(width: 15.w,),
                  Container(
                    width: 35.sp,
                    height: 35.sp,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: Center(child: Text("8", style: Styles.myTextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.h,),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notificationController.earlierNotification.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return renderingNotifications(notificationController.earlierNotification[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 5.h,);
              },
            ),
            SizedBox(height: 15.h,),
          ],
        ),
      ),
    );
  }

  renderingNotifications(Map data) {
    return Container(
      color: data["isOpen"] ? Colors.transparent : AppColors.primaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40.sp,
              width: 40.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
                image: DecorationImage(
                  image: AssetImage(data["imagePath"]),
                ),
              ),
            ),
            SizedBox(width: 10.w,),
            Container(
              width: 280.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data["title"], style: Styles.myTextStyle(fontSize: 16.sp,),),
                  SizedBox(height: 5.h,),
                  Text(data["time"], style: Styles.myTextStyle(fontSize: 12.sp, color: AppColors.blackColor.withOpacity(0.7)),),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
