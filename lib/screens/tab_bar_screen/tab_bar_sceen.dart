import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/app_config/styles.dart';
import 'package:timmarkus/screens/message_screen/message_screen.dart';
import 'package:timmarkus/screens/notification_screen/notification_screen.dart';

class TabBarScreen extends StatelessWidget {

  RxInt currentTabIndex = 0.obs;
  List<String> tabBarText = ['Messages', 'Notifications'];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        initialIndex: currentTabIndex.value,
        length: tabBarText.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: GestureDetector(
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
            bottom: TabBar(
              onTap: (index) {
                currentTabIndex.value = index;
              },
              isScrollable: true,
              indicatorColor: AppColors.primaryColor,
              indicatorWeight: 3.0,
              tabs: tabBarText.map(
                (e) => Tab(
                  child: Container(
                    width: 150.w,
                    child: Center(
                      child: Text(
                        e, style: Styles.myTextStyle(fontSize: 18.sp)
                      ),
                    )
                  ),
                )
              ).toList(),
            ),
          ),
          body: TabBarView(
            children: getTabBarViews(tabBarText),
          ),
        ),
      ),
    );
  }

  List<Widget> getTabBarViews(List movieCategory) {
    List<Widget> tab_bar_views = [];
    if (movieCategory.contains("Messages")) {
      tab_bar_views.add(MessageScreen());
    }
    if (movieCategory.contains("Notifications")) {
      tab_bar_views.add(NotificationScreen());
    }

    return tab_bar_views;
  }

}
