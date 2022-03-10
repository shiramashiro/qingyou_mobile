import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/actionable_list.dart';
import 'package:qingyuo_mobile/components/avatar.dart';

class UserCenterSlice extends StatefulWidget {
  const UserCenterSlice({Key? key}) : super(key: key);

  @override
  State<UserCenterSlice> createState() => _UserCenterSliceState();
}

class _UserCenterSliceState extends State<UserCenterSlice> {
  Map<String, dynamic> data = {
    'uname': '椎名白白',
    'sex': '男',
    'signature': 'Time tick away, dream faded away!',
    'uid': '7021686',
    'avatar': 'assets/images/95893409_p0.jpg'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(147, 181, 207, 6),
        title: const Text("账号资料"),
      ),
      body: ActionableList(
        data: data,
        template: [
          ActionableListTemplate(
            label: '头像',
            field: 'avatar',
            onTap: () {},
            createContent: (e) => Avatar(url: e, size: 55),
          ),
          ActionableListTemplate(
            label: '昵称',
            field: 'uname',
            onTap: () {},
            createContent: (e) => Text(e),
          ),
          ActionableListTemplate(
            label: '性别',
            field: 'sex',
            onTap: () {},
            createContent: (e) => Text(e),
          ),
          ActionableListTemplate(
            label: '个性签名',
            field: 'signature',
            onTap: () {},
            createContent: (e) => Text(e),
          ),
          ActionableListTemplate(
            isIcon: false,
            label: 'UID',
            field: 'uid',
            createContent: (e) => Text(e),
          )
        ],
      ),
    );
  }
}
