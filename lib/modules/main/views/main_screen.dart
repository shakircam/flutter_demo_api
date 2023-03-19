import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
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
    SettingsPage(),
    OtherPage(),
    LoginPage(),
  ];

  void initDynamicLinks() async{
    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
    /// `When app is terminated, or user just signs in/ signs up to app after clicking on dynamic link`
    /// shakircam.page.link
    PendingDynamicLinkData? data = await dynamicLinks.getInitialLink();
    Uri? deepLink = data?.link;
    if (deepLink != null) {
      var list = deepLink.toString().split(".link/");
      var validList = list[1].split("/");
      print("dynamic link terminated app $validList");
    }

    /// `When user clicks on dynamic link while app is not terminated`
    dynamicLinks.onLink.listen((dynamicLinkData) async {
      var list = dynamicLinkData.link.toString().split(".link/");
      var validList = list[1].split("/");
      print("dynamic link not terminated app$validList");

    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

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
