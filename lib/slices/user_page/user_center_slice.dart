import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qingyuo_mobile/components/actionable_list.dart';
import 'package:qingyuo_mobile/components/avatar.dart';
import 'package:qingyuo_mobile/providers/picture_provider.dart';
import 'package:qingyuo_mobile/service/slice/user_center_slice_service.dart';

class UserCenterSlice extends StatefulWidget {
  const UserCenterSlice({Key? key}) : super(key: key);

  @override
  State<UserCenterSlice> createState() => _UserCenterSliceState();
}

class _UserCenterSliceState extends State<UserCenterSlice> {

  final UserCenterSliceService _service = UserCenterSliceService();

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
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("账号资料"),
      ),
      body: Column(
        children: [
          ActionableList(
            data: data,
            template: [
              ActionableListTemplate(
                label: '头像',
                field: 'avatar',
                onTap: () {
                  _service.setImage(context);
                },
                createContent: (e) => Avatar(url: e, size: 55),
              ),
              ActionableListTemplate(
                label: '昵称',
                field: 'uname',
                onTap: () {
                },
                createContent: (e) => Text(e, style: const TextStyle(color: Colors.grey)),
              ),
              ActionableListTemplate(
                label: '性别',
                field: 'sex',
                onTap: () {},
                createContent: (e) => Text(e, style: const TextStyle(color: Colors.grey)),
              ),
              ActionableListTemplate(
                label: '个性签名',
                field: 'signature',
                onTap: () {},
                createContent: (e) => Text(
                  e,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ActionableListTemplate(
                isIcon: false,
                label: 'UID',
                field: 'uid',
                createContent: (e) => Text(e, style: const TextStyle(color: Colors.grey)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
