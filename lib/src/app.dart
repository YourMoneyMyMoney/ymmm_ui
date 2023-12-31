
import 'package:flutter/material.dart';//android
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ymmm_ui/User/LogIn/LoginPage.dart';

import 'package:ymmm_ui/src/pages/addPage.dart';
import 'package:ymmm_ui/src/pages/homePage.dart';
import 'package:ymmm_ui/src/pages/Layout.dart';
import 'package:ymmm_ui/src/pages/chartPage.dart';
import 'package:ymmm_ui/src/pages/settingPage.dart';
import 'package:ymmm_ui/User/LoginMainPage.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  dynamic userInfo = '';
  bool isLogin = false;
  static final storage = FlutterSecureStorage();

  @override
  void initState(){ 
    super.initState();  
    isLogin = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  } 

  _asyncMethod() async {
    userInfo = await storage.read(key: "login");
    if(userInfo != '' && userInfo != null){
      setState(() {
        isLogin = true;
      });
    }else{
      setState(() {
        isLogin = false;
      });
    }
  }

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
      home: !isLogin ? LoginMainPage(): Layout()
      
    );
  }
}