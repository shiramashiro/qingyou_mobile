import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qingyuo_mobile/components/actionable_list.dart';
import 'package:qingyuo_mobile/components/avatar.dart';
import 'package:qingyuo_mobile/database/sqlite_operation.dart';
import 'package:qingyuo_mobile/providers/user_provider.dart';
import 'package:qingyuo_mobile/service/slices/user_page/user_profile_slice_service.dart';
import 'package:sqflite/sqflite.dart';

class UserProfileSlice extends StatefulWidget {
  const UserProfileSlice({Key? key}) : super(key: key);

  @override
  State<UserProfileSlice> createState() => _UserProfileSliceState();
}

class _UserProfileSliceState extends State<UserProfileSlice> {
  late Map<String, dynamic> data = {};

  final UserProfileSliceService _service = UserProfileSliceService();

  @override
  void initState() {
    super.initState();
    _queryUserInfo();
  }

  _queryUserInfo() async {
    String table = 'user';
    SQLiteOperation sqlOp = SQLiteOperation(table: table);
    Database database = await sqlOp.connectSQLite();
    var user = await database.query(table);
    setState(() {
      data = user[0];
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
            data: data,
            template: [
              ActionableListTemplate(
                label: '头像',
                field: 'avatar',
                onTap: () {
                  // _service.updateAvatar(0, 'shiramashiro', context: context);
                  /// 1. 请求本地 sqlite 的数据之后，组件要把数据展示出来
                  /// 2. 直接给一个 data 即可。
                  /// 3. 修改某一条数据时，如，修改头像
                  /// 4. 选择图片之后，把图片发送到后台，后台存储图片，后台返回新图片的url给前端。
                  /// 5. 返回过来的新 url 要修改 data 里的数据。
                },
                content: (e) {
                  // var avatar = context.watch<UserProvider>().getUser.avatar;
                  return Avatar(
                    url: e,
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
