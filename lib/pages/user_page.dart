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

  Widget _createUserData() {
    return FloatingDatum(
      decoration: const FloatingDatumDecoration(padding: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Avatar(url: 'assets/images/95893409_p0.jpg', size: 60),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_data['uname'].toString()),
                const Text('正式会员'),
                const Text('游币：0.0')
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createCommonUtils() {
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

  Widget _createBasicService() {
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

  Widget _createReferralService() {
    return FloatingDatum(
      title: FloatingDatumTitle(
        title: const Text("推荐服务"),
        decoration: const FloatingDatumDecoration(mleft: 10, mbottom: 10),
      ),
      decoration: const FloatingDatumDecoration(padding: 10, mtop: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          ActionableIcon(text: '我的课程', path: "assets/icons/classes.svg"),
          ActionableIcon(text: '轻游公益', path: "assets/icons/public_welfare.svg"),
          ActionableIcon(text: '我的钱包', path: "assets/icons/wallet.svg"),
          ActionableIcon(text: '时光机', path: "assets/icons/time_machine.svg"),
        ],
      ),
    );
  }

  Widget _createMoreService() {
    return Container();
  }

  Widget _createAppBarTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        ActionableIcon(iconData: Icons.task),
        ActionableIcon(iconData: Icons.timer),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _createAppBarTitle(),
      ),
      body: Container(
        color: const Color.fromRGBO(239, 239, 239, 0.8),
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              _createUserData(),
              _createBasicService(),
              _createCommonUtils(),
              _createReferralService(),
              _createMoreService(),
            ],
          ),
        ),
      ),
    );
  }
}
