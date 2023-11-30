import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavigationBarWidget({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: [
        _bottomNavigationBarItem('icon_home', 'Home', 0),
        _bottomNavigationBarItem('icon_add', 'Add', 1),
        _bottomNavigationBarItem('icon_chart', 'Chart', 2),
        _bottomNavigationBarItem('icon_setting', 'Setting', 3),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String iconName, String label, int index) {
    Color iconColor = currentIndex == index ? Colors.black : Colors.grey;

    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/svg/${iconName}.svg',
        color: iconColor,
      ),
      label: label,
    );
  }
}
