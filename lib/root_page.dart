import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/pages/home_page.dart';
import 'package:qingyuo_mobile/pages/dynamic_page.dart';
import 'package:qingyuo_mobile/pages/shopping_page.dart';
import 'package:qingyuo_mobile/pages/user_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final Map<String, String> _bottomBarItems = {
    'home': '首页',
    'dynamic': '动态',
    'shopping': '轻游购',
    'user': '我的',
  };

  final List<Widget> _pages = const [
    HomePage(),
    DynamicPage(),
    ShoppingPage(),
    UserPage(),
  ];

  int _currentIndex = 0;

  BottomNavigationBarItem _createBottomBarItem(String iconName, String itemName) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        'assets/icons/$iconName.png',
        width: 25,
        height: 25,
      ),
      activeIcon: Image.asset(
        'assets/icons/$iconName.png',
        width: 25,
        height: 25,
      ),
      label: itemName,
    );
  }

  List<BottomNavigationBarItem> _createBottomBarItems() {
    List<BottomNavigationBarItem> items = [];
    _bottomBarItems.forEach((key, value) {
      items.add(_createBottomBarItem(key, value));
    });
    return items;
  }

  _setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _setCurrentIndex,
          items: _createBottomBarItems(),
          currentIndex: _currentIndex,
        ),
      ),
    );
  }
}
