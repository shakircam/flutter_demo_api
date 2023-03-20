import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../../authentication/views/login_page.dart';
import '../../home/views/home_page.dart';
import '../../other/views/details_info.dart';
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

  void handleDynamicLink() async {
    final PendingDynamicLinkData? initialLink =
    await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      final Uri deepLink = initialLink.link;
      print("dynamic link terminated app $deepLink");
      var isSettingPage = deepLink.pathSegments.contains('setting');
      print("dynamic link terminated app isSettingPage $isSettingPage");
      print("dynamic link terminated app isDetailsPage ${deepLink.pathSegments.contains('information-details')}");
      print("dynamic link terminated app isPage ${deepLink.pathSegments.contains('page')}");
      print("dynamic link terminated app id ${deepLink.queryParameters['id']}");

      if (isSettingPage) {
        try {
          print("Dynamic going to SettingPage");
          Get.toNamed(Routes.SETTINGS);
        } catch (e) {
          print("Dynamic link handle error $e");
        }
      } else if (deepLink.pathSegments.contains('page')) {
        try {
          String? id = deepLink.queryParameters['id'];
          if(id != null){
            print("Dynamic going to information-details and id $id");

            //Get.toNamed(Routes.INFORMATION_DETAILS, arguments: {"id":id});

            Navigator.pushNamedAndRemoveUntil(
              context,
              '/information-details',
                  (route) => route.isFirst,
              arguments: {'id': 'Firebase dynamic link app terminated.Id is $id'},
            );
           // Navigator.pushNamed(context, '/information-details', arguments: {'id': 'Firebase dynamic link app terminated.Id is $id',});

          }else{
            print("Dynamic going to information-details id null");
          }
        } catch (e) {
          print("Dynamic link handle error $e");
        }
      }
    }
    FirebaseDynamicLinks.instance.onLink.listen(
          (pendingDynamicLinkData) {
        if (pendingDynamicLinkData != null) {
          final Uri deepLink = pendingDynamicLinkData.link;
          var isSettingPage = deepLink.pathSegments.contains('setting');
          if (isSettingPage) {
            try {
              Get.toNamed(Routes.SETTINGS);
            } catch (e) {
              print("Dynamic link handle error $e");
            }
          } else if (deepLink.pathSegments.contains('page')) {
            try {
              String? id = deepLink.queryParameters['id'];
              Navigator.pushNamed(context, Routes.INFORMATION_DETAILS, arguments: {'id': 'Firebase dynamic link app open.Id is $id',});

            } catch (e) {
              print("Dynamic link handle error $e");
            }
          }
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    handleDynamicLink();
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
