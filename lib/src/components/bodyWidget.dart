import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ymmm_ui/User/LoginMainPage.dart';
import 'package:ymmm_ui/service/jwtService.dart';
import 'package:ymmm_ui/src/controller/HomeController.dart';

import '../../models/model.dart';

class BodyWidget extends StatefulWidget {
  final HomePageController controller;
  BodyWidget({required this.controller});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  static final storage = FlutterSecureStorage();
  dynamic userInfo='';
  String userName ='';
  @override
  void initState(){ 
    super.initState();  
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  } 

  _asyncMethod() async {
    userInfo = await storage.read(key: "login");
    Map<String, dynamic> valueMap = json.decode(userInfo);
    Login user = Login.fromJson(valueMap);
    
    if(userInfo != '' && userInfo != null){
      setState((){
        userName = user.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Hi, ${userName}',
                style: TextStyle(fontSize: 24),
              ),
              IconButton(
                onPressed: () {
                  widget.controller.toggleUserInfo();
                },
                icon: Image.asset('assets/png/Ellipse.png'),
              ),
              IconButton(
                onPressed: (){
                  logOut(storage);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginMainPage()));
                },
                icon: Icon(Icons.logout)
              )
            ],
          ),
          Obx(() {
            if (widget.controller.showUserInfo.value) {
              return Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('사용자 1로 전환');
                      },
                      child: Text(
                        "사용자 정보: 추가 계정 여기 1",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 0, 0),
                            fontSize: 18),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('사용자 2로 전환');
                      },
                      child: Text(
                        "사용자 정보: 추가 계정 여기 2",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 137, 137),
                            fontSize: 16),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('사용자 3으로 전환');
                      },
                      child: Text(
                        "사용자 정보: 추가 계정 여기 3",
                        style: TextStyle(
                            color: Color.fromARGB(255, 248, 179, 179),
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }
}
