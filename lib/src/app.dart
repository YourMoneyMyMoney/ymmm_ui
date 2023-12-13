
import 'package:flutter/material.dart';//android
import 'package:get/get.dart';

import 'package:ymmm_ui/src/pages/addPage.dart';
import 'package:ymmm_ui/src/pages/homePage.dart';
import 'package:ymmm_ui/src/pages/Layout.dart';
import 'package:ymmm_ui/src/pages/chartPage.dart';
import 'package:ymmm_ui/src/pages/settingPage.dart';
import 'package:ymmm_ui/User/LoginMainPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'), 
      initialRoute: '/',
      getPages: [
        GetPage(name: '/Home', page: () => homePage()),    
        GetPage(name: '/Add', page: () =>  AddPage()),
        GetPage(name: '/Chart', page: () => ChartPage()),
        GetPage(name: '/Setting', page: () => SettingsPage()),
      ],
      home: true? LoginMainPage(): Layout()
      
    );
  }
}