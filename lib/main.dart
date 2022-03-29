import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qingyuo_mobile/pages/login_page.dart';
import 'package:qingyuo_mobile/providers/user_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        var easyLoading = EasyLoading.init();
        EasyLoading.instance
          ..radius = 20
          ..maskType = EasyLoadingMaskType.clear
          ..loadingStyle = EasyLoadingStyle.dark;
        return easyLoading(context, widget);
      },
      home: const LoginPage(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(147, 181, 207, 6),
        ),
      ),
    );
  }
}
