import 'package:flutter/material.dart';

class Roadmap {
  static void push(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => widget),
      (route) => false,
    );
  }
}
