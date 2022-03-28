import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qingyuo_mobile/components/actionable_list.dart';
import 'package:qingyuo_mobile/components/avatar.dart';
import 'package:qingyuo_mobile/providers/user_provider.dart';
import 'package:qingyuo_mobile/service/user_page_slice_service.dart';

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

  final UserPageSliceService _service = UserPageSliceService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  _service.updateAvatar(0, 'shiramashiro', context: context);
                },
                content: (e) {
                  var avatar = context.watch<UserProvider>().getUser.avatar;
                  print(avatar);
                  return Avatar(
                    url: avatar ?? '',
                    size: 55,
                  );
                },
              ),
              ActionableListTemplate(
                label: '昵称',
                field: 'uname',
                content: (e) => Text(
                  e,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              ActionableListTemplate(
                label: '性别',
                field: 'sex',
                content: (e) => Text(
                  e,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              ActionableListTemplate(
                label: '个性签名',
                field: 'signature',
                content: (e) => Text(
                  e,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              ActionableListTemplate(
                isIcon: false,
                label: 'UID',
                field: 'uid',
                content: (e) => Text(
                  e,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
