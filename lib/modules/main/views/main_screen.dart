

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';
import '../../authentication/views/login_page.dart';
import '../../home/views/home_page.dart';
import '../../other/views/other_page.dart';
import '../../setting/views/setting_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    const SettingsPage(),
    const OtherPage(),
     LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: AppColors.navigationInactiveColor,
            ),
            label: 'HOME',
            activeIcon: Icon(
              Icons.home,
              color: AppColors.navigationActiveColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: AppColors.navigationInactiveColor,
            ),
            label: 'Settings',
            activeIcon: Icon(
              Icons.settings,
              color: AppColors.navigationActiveColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more,
              color: AppColors.navigationInactiveColor,
              size: 36,
            ),
            label: 'Other',
            activeIcon: Icon(
              Icons.more,
              color: AppColors.navigationActiveColor,
              size: 36,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.login,
              color: AppColors.navigationInactiveColor,
              size: 36,
            ),
            label: 'Login',
            activeIcon: Icon(
              Icons.login,
              color: AppColors.navigationActiveColor,
              size: 36,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

}