import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qingyuo_mobile/pages/roots/boot_page.dart';
import 'package:qingyuo_mobile/slices/user_page/user_center_slice.dart';
import 'package:qingyuo_mobile/slices/user_page/user_profile_slice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/user/center': (context) => const UserCenterSlice(),
        '/user/profile': (context) => const UserProfileSlice()
      },
      debugShowCheckedModeBanner: false,
      home: const BootPage(),
      builder: EasyLoading.init(),
    );
  }
}
