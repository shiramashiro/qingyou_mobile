import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/utils/callbacks.dart';

/// 圆形按钮
class CircleButton extends StatelessWidget {
  final OnTap? onTap;
  final String text;

  const CircleButton({
    Key? key,
    this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(20),
      shape: const CircleBorder(
        side: BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
    );
  }
}
