
import 'dart:convert';

import 'package:flutter/material.dart';//android
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ymmm_ui/User/LogIn/CreateBook.dart';
import 'package:ymmm_ui/User/LogIn/LoginPage.dart';
import 'package:ymmm_ui/models/model.dart';
import 'package:ymmm_ui/service/bookApi.dart';

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
  bool isFirstLogin = false;
  late Map<int, String> currencyList;
  static final storage = FlutterSecureStorage();

  @override
  void initState(){ 
    super.initState();  
    isLogin = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  } 

  void _asyncMethod() async {
    userInfo = await storage.read(key: "login");
    if(userInfo != '' && userInfo != null){
      fetchCurrencyList();
      setState(() {
        isLogin = true;
      });
    }else{
      setState(() {
        isLogin = false;
      });
    }
  }

  void fetchCurrencyList() async {
    Map<int, String> bookList = {};
    final bookResponse = await getBooks();
    if(bookResponse.statusCode == 200){
      var data = jsonDecode(bookResponse.body);
      data.forEach((book)=>{
        bookList[book['book']['id']] = book['book']['title']
      });
    }
    if(bookList.isEmpty){
      isFirstLogin = true;
      final response = await getCurrencies();
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        data.forEach((currency)=>{
          currencyList[currency['id']] = currency['name']
        });
      }
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
      home: !isLogin ? LoginMainPage(): isFirstLogin? CreateBook(currencyList: currencyList): Layout()
      
    );
  }
}