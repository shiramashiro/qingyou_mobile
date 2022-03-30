import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/avatar.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          // 个人平片
          Container(
            height: 100,
            // 整体横向布局
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 用户头像
                 Avatar(url: 'assets/images/95893409_p0.jpg', size: 60),
                // 个人信息栏
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('椎名白白'),
                      Text('正式会员'),
                      // 钱包信息
                      Row(
                        children: [
                          Text('B币： 0.0'),
                          Text('硬币：177'),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
