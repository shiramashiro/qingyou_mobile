import 'package:flutter/material.dart';

class Roadmap {
  static void push(dynamic context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => widget),
      (route) => false,
    );
  }

  static void pushAnimatedly(dynamic context, dynamic widget) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
      ),
    );
  }
}
