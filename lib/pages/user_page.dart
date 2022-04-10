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
      decoration: const FloatingDatumDecoration(padding: 10),
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
      title: FloatingDatumTitle(
        title: const Text("常用工具"),
        decoration: const FloatingDatumDecoration(mbottom: 10, mleft: 10),
      ),
      decoration: const FloatingDatumDecoration(padding: 10, mtop: 10),
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
    return FloatingDatum(
      title: FloatingDatumTitle(
        title: const Text("用户服务"),
        decoration: const FloatingDatumDecoration(mleft: 10, mbottom: 10),
      ),
      decoration: const FloatingDatumDecoration(padding: 10, mtop: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          ActionableIcon(text: '浏览历史', path: "assets/icons/history.svg"),
          ActionableIcon(text: '我的收藏', path: "assets/icons/collection.svg"),
          ActionableIcon(text: '创作平台', path: "assets/icons/write_platform.svg"),
          ActionableIcon(text: '个性装扮', path: "assets/icons/dressing.svg"),
        ],
      ),
    );
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
              _createUserService(),
              _createUserUtils(),
              _createUserExploration(),
            ],
          ),
        ),
      ),
    );
  }
}
