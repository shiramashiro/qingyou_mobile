import 'package:flutter/material.dart';

class Roadmap {
  static void pushAndRemoveUntil(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => widget),
      (route) => false,
    );
  }

  static void push(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) => widget),
    );
  }
}
