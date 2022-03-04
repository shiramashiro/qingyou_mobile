import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;
  final Color lineColor;
  final double height;
  final double lrMargin;
  final double fontSize;

  const TextDivider(
    this.text, {
    Key? key,
    this.lineColor = Colors.grey,
    this.height = 4,
    this.lrMargin = 4,
    this.fontSize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            height: height,
            color: lineColor,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: lrMargin, right: lrMargin),
          child: Text(
            text,
            style: TextStyle(color: lineColor, fontSize: fontSize),
          ),
        ),
        Expanded(
          child: Divider(
            height: height,
            color: lineColor,
          ),
        ),
      ],
    );
  }
}
