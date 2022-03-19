import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qingyuo_mobile/pages/roots/boot_page.dart';
import 'package:qingyuo_mobile/providers/user_provider.dart';

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
      home: const BootPage(),
      builder: EasyLoading.init(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(147, 181, 207, 6),
        ),
      ),
    );
  }
}
