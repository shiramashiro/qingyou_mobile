import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/multifunctional_list.dart';

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
    'uid': '7021686'
  };

  /// 1. 从后端查询的一个JSON
  /// 格式可能是这样的：
  /// {
  ///   sex: '男',
  ///   age: 10,
  ///   uid: 1111
  /// }
  ///
  /// 循环的第一回：
  /// 模板的 content 字段可能接收这样的内容 uid
  /// object['uid']

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(147, 181, 207, 6),
        title: const Text("账号资料"),
      ),
      body: MultifunctionalList(
        data: data,
        items: [
          MultifunctionalListData(
            label: '昵称',
            fieldName: 'uname',
          ),
          MultifunctionalListData(
            label: '性别',
            fieldName: 'sex',
          ),
          MultifunctionalListData(
            label: '个性签名',
            fieldName: 'signature',
          ),
          MultifunctionalListData(
            label: 'UID',
            fieldName: 'uid',
          )
        ],
      ),
    );
  }
}
