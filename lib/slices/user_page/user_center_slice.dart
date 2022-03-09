import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/multifunctional_list.dart';

class UserCenterSlice extends StatefulWidget {
  const UserCenterSlice({Key? key}) : super(key: key);

  @override
  State<UserCenterSlice> createState() => _UserCenterSliceState();
}

class _UserCenterSliceState extends State<UserCenterSlice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(147, 181, 207, 6),
        title: const Text("账号资料"),
      ),
      body: MultifunctionalList(
        items: [
          MultifunctionalListData(
            label: '昵称',
            content: Text('椎名白白'),
          ),
          MultifunctionalListData(
            label: '性别',
            content: Text('男'),
          ),
          MultifunctionalListData(
            label: '个性签名',
            content: Text('Time tick away, dream faded away!'),
          ),
          MultifunctionalListData(
            label: 'UID',
            content: Text('7021686'),
          )
        ],
      ),
    );
  }
}
