import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/utils/callbacks.dart';

class UnderlineTextButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final OnTap? onTap;
  final Color? color;

  const UnderlineTextButton({
    Key? key,
    required this.text,
    this.fontSize = 14,
    this.onTap,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
