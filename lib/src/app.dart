
import 'package:flutter/material.dart';//android
import 'package:flutter/cupertino.dart';//ios
import 'package:get/get.dart';

import 'package:ymmm_ui/src/pages/addPage.dart';
import 'package:ymmm_ui/src/pages/homePage.dart';
import 'package:ymmm_ui/src/pages/Layout.dart';
import 'package:ymmm_ui/src/pages/chartPage.dart';
import 'package:ymmm_ui/src/pages/settingPage.dart';

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
      home: //StreamBuilder<User?>(
        // stream: FirebaseAuth.instance.authStateChanges(),
        // builder: (context, snapshot) {
        //   if (snapshot.connectionState == ConnectionState.active) {
        //     User? user = snapshot.data;
        //     if (user == null) {
        //       return LoginMainPage();
        //     }
            /* return*/  Layout()
          
      //     } 
      //   },
      // ),
      
    );
  }
}