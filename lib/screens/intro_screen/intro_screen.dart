import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/screens/auth_screen/sign_in_screen.dart';
import 'package:timmarkus/screens/home_pages/homepage.dart';
import 'package:timmarkus/statics/static_var.dart';
import 'package:timmarkus/widgets/my_filled_button.dart';

class IntroScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'Canva',
      subTitle: 'Intro - - - - - - - - - - - - - - - - - - Text',
      imageUrl: 'assets/image/intro_image_1.png',
    ),
    Introduction(
      title: 'Canva',
      subTitle: 'Intro - - - - - - - - - - - - - - - - - - Text',
      imageUrl: 'assets/image/intro_image_2.png',
    ),
    Introduction(
      title: 'Canva',
      subTitle: 'Intro - - - - - - - - - - - - - - - - - - Text',
      imageUrl: 'assets/image/intro_image_3.png',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          onPageChanged: (index) {
            if(index==3) {
              print("sdjfsd");
            }
          },
          itemCount: list.length,
          padEnds: true,
          scrollDirection: Axis.horizontal,
          reverse: false,
          itemBuilder: (BuildContext context, int index) {
            return renderingIntroScreen(list[index], index);
          },
        ),
      ),
    );
  }

  renderingIntroScreen(Introduction intro, int index) {
    return Container(
      height: StaticVariable.height,
      width: StaticVariable.width,
      child: Column(
        children: [
          SizedBox(height: 115.h),
          Container(
            height: 274.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(intro.imageUrl)
              )
            ),
          ),
          SizedBox(height: 85.h),
          Text(intro.title, style: Styles.introBoldTextStyle(),),
          SizedBox(height: 30.h),
          Text(intro.subTitle, style: Styles.textFieldlabelTextStyle(),),
          SizedBox(height: index == 2 ? 50.h : 75.h),
          Stack(
            children: [
              Container(
                width: 232.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(20.sp)
                ),
              ),
              Container(
                width: index == 0 ? 73.33.w : index == 1 ? 146.66.w : 232.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.sp),
                    topLeft: Radius.circular(20.sp),
                    bottomRight: Radius.circular(index==2 ? 20.sp: 0.sp),
                    topRight: Radius.circular(index==2 ? 20.sp: 0.sp),
                  )
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          index == 2
            ? Column(
              children: [
                MyFilledButton(
                  width: 270.w,
                  height: 40.h,
                  txt: "SIGN IN",
                  borderRadius: 10.sp,
                  ontap: () {
                    Get.to(() => SignInScreen());
                  },
                ),
                SizedBox(height: 7.h),
                MyFilledButton(
                  width: 270.w,
                  height: 40.h,
                  txt: "HOMEPAGE",
                  borderRadius: 10.sp,
                  ontap: () {
                    Get.to(() => HomePage());
                  },
                ),
              ],
            )
            : Container()
        ],
      ),
    );
  }
}