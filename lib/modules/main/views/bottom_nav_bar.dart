

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../controllers/bottom_nav_controller.dart';
import '../model/menu_code.dart';
import '../model/menu_item.dart';

class BottomNavBar extends StatelessWidget {
  final Function(MenuCode menuCode) onNewMenuSelected;

  BottomNavBar({Key? key, required this.onNewMenuSelected}) : super(key: key);


  final navController = BottomNavController();

  final Key bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    Color selectedItemColor = Colors.white;
    Color unselectedItemColor = Colors.grey;
    List<BottomNavItem> navItems = _getNavItems();

    return Obx(
          () => BottomNavigationBar(
        key: bottomNavKey,
        items: navItems
            .map(
              (BottomNavItem navItem) => BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "images/${navItem.iconSvgName}",
                height: AppValues.iconDefaultSize,
                width: AppValues.iconDefaultSize,
                color:
                navItems.indexOf(navItem) == navController.selectedIndex
                    ? selectedItemColor
                    : unselectedItemColor,
              ),
              label: navItem.navTitle,
              tooltip: ""),
        )
            .toList(),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.colorAccent,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        currentIndex: navController.selectedIndex,
        onTap: (index) {
          navController.updateSelectedIndex(index);
          onNewMenuSelected(navItems[index].menuCode);
        },
      ),
    );
  }

  List<BottomNavItem> _getNavItems() {
    return [
      BottomNavItem(
        navTitle: 'Home',
        iconSvgName: "ic_home.svg",
        menuCode: MenuCode.HOME,
      ),
      BottomNavItem(
          navTitle: 'Other',
          iconSvgName: "ic_favorite.svg",
          menuCode: MenuCode.FAVORITE),
      BottomNavItem(
          navTitle: 'Settings',
          iconSvgName: "ic_settings.svg",
          menuCode: MenuCode.SETTINGS)
    ];
  }
}