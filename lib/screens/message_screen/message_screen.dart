import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/screens/message_screen/chat_screen.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h,),
            Row(
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
            SizedBox(height: 25.h,),
            Expanded(
              child: ListView.separated(
                itemCount: 12,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return renderingPeopleChats();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.h,);
                },
              ),
            ),
            SizedBox(height: 15.h,),
          ],
        ),
      ),
    );
  }

  renderingPeopleChats() {
    return GestureDetector(
      onTap: () {
        Get.to(() => ChatScreen());
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.sp,
            width: 50.sp,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/people.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w,),
          Container(
            width: 270.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("The Workers", style: Styles.myTextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),),
                    Spacer(),
                    Text("4 hours ago", style: Styles.myTextStyle(fontSize: 12.sp, color: AppColors.blackColor.withOpacity(0.7)),),
                  ],
                ),
                SizedBox(height: 5.h,),
                Text("Sure sir! i will design it. Tell me when you want this?", style: Styles.myTextStyle(fontSize: 14.sp, color: AppColors.blackColor.withOpacity(0.9)),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
