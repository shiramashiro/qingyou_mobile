import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/actionable_list.dart';
import 'package:qingyuo_mobile/components/app_bar_row_back.dart';
import 'package:qingyuo_mobile/components/avatar.dart';
import 'package:qingyuo_mobile/pages/roots/root_page.dart';
import 'package:qingyuo_mobile/pages/slices/user_page/subslice/uname_editing.dart';
import 'package:qingyuo_mobile/service/slices/user_page/user_profile_service.dart';
import 'package:qingyuo_mobile/utils/roadmap.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final UserProfileService _service = UserProfileService();
  Map<String, Object?> _userData = {'uname': '', 'sex': '', 'signature': '', 'id': '', 'avatar': 'assets/images/95893409_p0.jpg'};

  @override
  void initState() {
    super.initState();
    _setUserData();
  }

  _setUserData() async {
    var userData = await _service.getUser(where: ['id', 'uname', 'avatar', 'signature', 'sex']);
    setState(() {
      _userData = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarRowBack(widget: RootPage(), title: '账号资料'),
      ),
      body: Column(
        children: [
          ActionableList(
            data: _userData,
            template: [
              ActionableListTemplate(
                label: '头像',
                field: 'avatar',
                onTap: () {
                  _service.updateAvatar(0, 'shiramashiro', context: context);
                },
                content: (e) => Avatar(url: e, size: 55),
              ),
              ActionableListTemplate(
                label: '昵称',
                field: 'uname',
                onTap: () {
                  Roadmap.push(context, const UnameEditing());
                },
                content: (e) => Text(e, style: const TextStyle(color: Colors.grey)),
              ),
              ActionableListTemplate(
                label: '性别',
                field: 'sex',
                content: (e) => Text(e, style: const TextStyle(color: Colors.grey)),
              ),
              ActionableListTemplate(
                label: '个性签名',
                field: 'signature',
                content: (e) => Text(e, style: const TextStyle(color: Colors.grey)),
              ),
              ActionableListTemplate(
                isIcon: false,
                label: 'UID',
                field: 'id',
                content: (e) => Text('$e', style: const TextStyle(color: Colors.grey)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
