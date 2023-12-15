import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymmm_ui/src/components/appBarWidget.dart';
import 'package:ymmm_ui/src/components/bodyWidget.dart';
import 'package:ymmm_ui/src/controller/HomeController.dart';

class homePage extends StatefulWidget {
  homePage({super.key});
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final controller = Get.put(HomePageController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: BodyWidget(controller: controller,),
      backgroundColor: Colors.white,
      
    );
  }
}