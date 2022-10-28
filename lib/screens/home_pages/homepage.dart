import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timmarkus/controller%20/bottom_bar_controller.dart';
import 'package:timmarkus/screens/home_pages/home_screen_tab.dart';
import 'package:timmarkus/screens/home_pages/menu_screen_tab.dart';
import 'package:timmarkus/screens/home_pages/project_screen_tab.dart';
import 'package:timmarkus/screens/home_pages/pro_screen_tab.dart';
import 'package:timmarkus/widgets/navigation_bar.dart';

class HomePage extends StatelessWidget {

  int i=1;
  RxBool progressing = false.obs;
  BottomBarController bottomBarController=Get.find();

  final List _tabs = [
    HomeScreenTab(),
    ProjectScreenTab(),
    ProScreenTab(),
    MenuScreenTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => progressing.value
          ? const Center(child: CircularProgressIndicator(),)
          : _tabs[bottomBarController.currentBNBIndex.value]
      ),
      bottomNavigationBar: BottomNavigateBar(),
    );
  }

}