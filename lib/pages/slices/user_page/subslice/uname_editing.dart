import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qingyuo_mobile/components/app_bar_row_back.dart';
import 'package:qingyuo_mobile/models/user_model.dart';
import 'package:qingyuo_mobile/pages/slices/user_page/user_profile.dart';
import 'package:qingyuo_mobile/service/slices/user_page/user_profile_service.dart';

class UnameEditing extends StatefulWidget {
  const UnameEditing({Key? key}) : super(key: key);

  @override
  State<UnameEditing> createState() => _UnameEditingState();
}

class _UnameEditingState extends State<UnameEditing> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final UserProfileService _service = UserProfileService();
  final TextEditingController _uname = TextEditingController();

  void _createScreenUtil() {
    ScreenUtil.init(
      BoxConstraints(maxWidth: MediaQuery.of(context).size.width, maxHeight: MediaQuery.of(context).size.height),
      context: context,
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      minTextAdapt: true,
      orientation: Orientation.portrait,
    );
  }

  Widget _createFormField() {
    return TextFormField(
      controller: _uname,
      minLines: 1,
      obscureText: false,
      decoration: const InputDecoration(hintText: '请输入新的用户名'),
    );
  }

  Widget _createFormButton() {
    return Container(
      margin: EdgeInsets.only(top: 0.02.sh),
      child: ElevatedButton(
        child: const Text('保存'),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        ),
        onPressed: () {
          _service.updateUname(User(uname: _uname.text, id: 6));
        },
      ),
    );
  }

  Widget _createForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _createFormField(),
          _createFormButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _createScreenUtil();
    return Scaffold(
      appBar: AppBar(
        title: const AppBarRowBack(widget: UserProfile(), title: '编辑用户名'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0.05.sw, 0.02.sh, 0.05.sw, 0),
        child: _createForm(),
      ),
    );
  }
}
