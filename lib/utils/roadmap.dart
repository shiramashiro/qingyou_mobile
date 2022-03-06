import 'package:flutter/material.dart';

class Roadmap {
  static void push(dynamic context, dynamic widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => widget),
      (route) => false,
    );
  }
}
