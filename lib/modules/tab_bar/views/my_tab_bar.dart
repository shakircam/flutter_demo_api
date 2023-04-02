import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/modules/tab_bar/views/generic_tab_page.dart';
import 'package:flutter_demo/modules/tab_bar/views/therapetic_tab_page.dart';

import 'brand_tab_page.dart';

class MyTabBar extends StatefulWidget {
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  void _handleSearch(String query) {
    setState(() {
      _query = query;
    });
  }

  List<String> _filterItems(List<String> items, String query) {
    if (query.isEmpty) {
      return items;
    } else {
      return items.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: _handleSearch,
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Brand'),
            Tab(text: 'Generic'),
            Tab(text: 'Therapetic'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const[
          BrandTabPage(),
          GenericTabPage(),
          TherapeticTabPage(),
        ],
      ),
    );
  }
}