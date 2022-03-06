import 'package:flutter/material.dart';

import 'package:qingyuo_mobile/components/avatar.dart';
import 'package:qingyuo_mobile/components/clickable_icon.dart';
import 'package:qingyuo_mobile/components/icon_in_input.dart';

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

  Widget _createTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Avatar(url: "assets/images/95893409_p0.jpg", size: 40),
        const IconInInput(
          hintText: '输入你想要搜索的内容',
          contentStyle: TextStyle(fontSize: 12),
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        ClickableIcon(onTap: () {}, icon: Icons.email)
      ],
    );
  }

  _setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(147, 181, 207, 6),
        title: _createTitle(),
      ),
      body: const Text('root page'),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _setCurrentIndex,
        items: _createBottomBarItems(),
        currentIndex: _currentIndex,
      ),
    );
  }
}
