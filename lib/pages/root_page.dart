import 'package:flutter/material.dart';

import 'package:qingyuo_mobile/components/avatar.dart';
import 'package:qingyuo_mobile/components/clickable_icon.dart';
import 'package:qingyuo_mobile/components/icon_in_input.dart';
import 'package:qingyuo_mobile/slices/root_page/hotpost_slice.dart';
import 'package:qingyuo_mobile/slices/root_page/hotvideo_slice.dart';
import 'package:qingyuo_mobile/slices/root_page/recommend_slice.dart';
import 'package:qingyuo_mobile/slices/root_page/sight_slice.dart';
import 'package:qingyuo_mobile/slices/root_page/tech_slice.dart';

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
        ClickableIcon(onTap: () {}, icon: Icons.camera),
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
    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(147, 181, 207, 6),
          title: _createTitle(),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [Text('热门贴子'), Text('推荐'), Text('热门视频'), Text('美景'), Text('技术')],
          ),
        ),
        body: const TabBarView(
          children: [
            HotpostSlice(),
            RecommendSlice(),
            HotvideoSlice(),
            SightSlice(),
            TechSlice(),
          ],
        ),
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
