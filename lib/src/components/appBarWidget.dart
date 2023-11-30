
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {


  @override
  Widget build(BuildContext context) {
    return AppBar(
     toolbarHeight: 80,
      centerTitle: true,
      title: Text(
        "YMMM",
        style: TextStyle(
          color: Colors.black,
          
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: IconButton(
            onPressed: () {
              print('오른쪽 상단의 알림 아이콘 클릭');
            },
            icon: SvgPicture.asset(
              'assets/svg/icon_notifications_none_.svg',
            ),
            iconSize: 50,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
