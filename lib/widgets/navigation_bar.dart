import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timmarkus/app_config/app_colors.dart';
import 'package:timmarkus/controller%20/bottom_bar_controller.dart';


class BottomNavigateBar extends StatelessWidget {
  BottomBarController bottomController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetX<BottomBarController>(
      builder: (controller) {
        return  BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          currentIndex: controller.currentBNBIndex.value,
          onTap: controller.indexChanged,
          selectedItemColor: AppColors.primaryColor.withOpacity(0.9),
          unselectedItemColor: AppColors.blackColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/navigation_bar_icon/home.png"),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/navigation_bar_icon/projects.png"),
              ),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/navigation_bar_icon/pro.png"),
              ),
              label: 'Pro',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/navigation_bar_icon/menu.png"),
              ),
              label: 'Menu',
            ),
          ],
        );
      }
    );
  }
}