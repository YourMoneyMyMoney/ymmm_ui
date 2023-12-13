import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymmm_ui/src/components/bottomNavigationBarWidget.dart';
import 'package:ymmm_ui/src/controller/HomeController.dart';
import 'package:ymmm_ui/src/pages/addPage.dart';
import 'package:ymmm_ui/src/pages/homePage.dart';
import 'package:ymmm_ui/src/pages/chartPage.dart';
import 'package:ymmm_ui/src/pages/settingPage.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());
  
    return Scaffold(
      body: PageView(
        onPageChanged: controller.animateTabIndex,
        controller: controller.pageController,
        physics: BouncingScrollPhysics(),
        children: [
          homePage(),
          AddPage(),
          ChartPage(),
          SettingsPage()
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Obx(
        () => BottomNavigationBarWidget(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changeTabIndex(index);
            print(controller.currentIndex.value);
          },
        ),
      ),
    );
  }
}

