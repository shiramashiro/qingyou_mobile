import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/avatar.dart';
import 'package:qingyuo_mobile/components/text_icon.dart';

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
    return Container(
      height: 100,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: const [
            TextIcon(text: '旅游札记', iconPath: "assets/icons/history.svg", iconType: 'svg'),
          ],
        ),
        Row(
          children: [
          ],
        )
      ],
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
      body: Column(
        children: [
          _createUserPlank(),
          _createUserUtils(),
          _createUserService(),
          _createUserExploration(),
        ],
      ),
    );
  }
}
