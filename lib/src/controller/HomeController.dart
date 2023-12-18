import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  late PageController pageController;
  var userName = 'Jiung (UserName)'.obs;
  var showUserInfo = false.obs;
  var currentIndex = 0.obs;


void onInit() async {
  pageController = PageController(initialPage: 0);
  super.onInit();
}
void onClose(){
  pageController.dispose();
  super.onClose();
}
  void toggleUserInfo() {
    showUserInfo.value = !showUserInfo.value;
  }
    void changeTabIndex(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);

  }
    void animateTabIndex(int index) {
    currentIndex.value = index;
    pageController.animateToPage(index,duration: const Duration(milliseconds:300),curve: Curves.ease);

  }
  
}
