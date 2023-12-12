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
      
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
