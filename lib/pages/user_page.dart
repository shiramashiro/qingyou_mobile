import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/avatar.dart';
import 'package:qingyuo_mobile/components/actionable_icon.dart';
import 'package:qingyuo_mobile/components/floating_datum.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Map<String, Object?> _data = {'uname': 'shiramashiro', 'sex': '', 'signature': '', 'id': '', 'avatar': 'assets/images/95893409_p0.jpg'};

  Widget _createUserBrief() {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_data['uname'].toString()),
          Text('正式会员'),
          // 钱包信息
          Row(
            children: [Text('B币： 0.0'), Text('硬币：177')],
          )
        ],
      ),
    );
  }

  Widget _createUserPlank() {
    return FloatingDatum(
      ptop: 20,
      pbottom: 20,
      pleft: 10,
      pright: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Avatar(url: 'assets/images/95893409_p0.jpg', size: 60),
          _createUserBrief(),
        ],
      ),
    );
  }

  Widget _createUserUtils() {
    return FloatingDatum(
      mtop: 20,
      padding: 10,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ActionableIcon(text: '札记', path: "assets/icons/notes.svg"),
              ActionableIcon(text: '计算器', path: "assets/icons/computer.svg"),
              ActionableIcon(text: '观测枢', path: "assets/icons/telescope.svg"),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                ActionableIcon(text: '轻游铺', path: "assets/icons/shop.svg"),
                ActionableIcon(text: '炼金台', path: "assets/icons/laboratory.svg"),
                ActionableIcon(text: '地图', path: "assets/icons/map.svg"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createUserService() {
    return Container();
  }

  Widget _createUserExploration() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: const Color.fromRGBO(239, 239, 239, 0.8),
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              _createUserPlank(),
              _createUserUtils(),
              _createUserService(),
              _createUserExploration(),
            ],
          ),
        ),
      ),
    );
  }
}
