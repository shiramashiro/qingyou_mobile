import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/actionable_list.dart';
import 'package:qingyuo_mobile/components/avatar.dart';
import 'package:qingyuo_mobile/database/sqlite_operation.dart';

class UserProfileSlice extends StatefulWidget {
  const UserProfileSlice({Key? key}) : super(key: key);

  @override
  State<UserProfileSlice> createState() => _UserProfileSliceState();
}

class _UserProfileSliceState extends State<UserProfileSlice> {
  Map<String, Object?> _data = {'uname': '', 'sex': '', 'signature': '', 'id': 0, 'avatar': ''};

  @override
  void initState() {
    super.initState();
    _queryUserInfo();
  }

  _queryUserInfo() async {
    var table = 'userinfo';
    var sqlOp = SQLiteOperation(table: table);
    var database = await sqlOp.connectSQLite();
    var user = await database.query(table, columns: ['uname', 'sex', 'signature', 'id', 'avatar']);
    setState(() {
      _data = user[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("账号资料"),
      ),
      body: Column(
        children: [
          ActionableList(
            data: _data,
            template: [
              ActionableListTemplate(
                label: '头像',
                field: 'avatar',
                onTap: () {},
                content: (e) {
                  return Avatar(url: e, size: 55);
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
                field: 'id',
                content: (e) => Text(
                  '$e',
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
