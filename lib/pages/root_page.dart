import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final Map<String, String> _bottomBarItems = {
    'home': '首页',
    'user': '我的',
  };

  int _currentIndex = 0;

  BottomNavigationBarItem _createBottomBarItem(String iconName, String itemName) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        'assets/icons/$iconName.png',
        width: 30,
        height: 30,
      ),
      activeIcon: Image.asset(
        'assets/icons/$iconName.png',
        width: 30,
        height: 30,
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

  Widget createTitle() {
    return Row(
      children: const [
        SizedBox(
          width: 40,
          height: 40,
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/95893409_p0.jpg',
            ),
          ),
        )
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
        title: createTitle(),
      ),
      body: Text('root page'),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setCurrentIndex,
        items: _createBottomBarItems(),
        currentIndex: _currentIndex,
      ),
    );
  }
}
