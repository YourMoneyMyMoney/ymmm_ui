import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymmm_ui/src/components/appBarWidget.dart';
import 'package:ymmm_ui/src/components/bodyWidget.dart';

import 'package:ymmm_ui/src/controller/androidHomeController.dart';

class homePage extends StatelessWidget {
   homePage({super.key});
final controller = Get.put(AndroidHomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
       body: BodyWidget(controller: controller),
      backgroundColor: Colors.white,
      
    );
  }
}