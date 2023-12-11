import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ymmm_ui/src/controller/HomeController.dart';

class BodyWidget extends StatelessWidget {
  final HomePageController controller;

  BodyWidget({required this.controller});

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
                'Hi, ${controller.userName.value}',
                style: TextStyle(fontSize: 24),
              ),
              IconButton(
                onPressed: () {
                  controller.toggleUserInfo();
                },
                icon: Image.asset('assets/png/Ellipse.png'),
              ),
            ],
          ),
          Obx(() {
            if (controller.showUserInfo.value) {
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
