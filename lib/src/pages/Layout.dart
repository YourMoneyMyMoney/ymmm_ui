import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ymmm_ui/User/LoginMainPage.dart';
import 'package:ymmm_ui/src/components/bottomNavigationBarWidget.dart';
import 'package:ymmm_ui/src/controller/HomeController.dart';
import 'package:ymmm_ui/src/pages/addPage.dart';
import 'package:ymmm_ui/src/pages/homePage.dart';
import 'package:ymmm_ui/src/pages/chartPage.dart';
import 'package:ymmm_ui/src/pages/settingPage.dart';

class Layout extends StatefulWidget {
  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  static final storage = FlutterSecureStorage();
  dynamic userName = '';
  
  @override
  void initState(){ 
    super.initState();  
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  } 

  _asyncMethod() async {
    userName = await storage.read(key: "name");
    if(userName == ''){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginMainPage()));
    }
  }

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

