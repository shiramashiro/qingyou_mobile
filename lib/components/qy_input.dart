import 'package:flutter/material.dart';

class QYInput extends StatefulWidget {
  /// [minLines] 最大行数
  final int minLines;

  /// [labelText] 输入框标签文本
  final String? labelText;

  /// [hintText] 输入框提示文本
  final String? hintText;

  /// [radius] 输入框圆角半径
  final double radius;

  /// [themeColor] 输入框的主题颜色
  final Color themeColor;

  /// [autoFocus] 是否自动聚焦到输入框
  final bool autoFocus;

  /// [prefixIcon] 输入框前缀图标
  final IconData prefixIcon;

  /// [obscureText] 是否开启模糊文本
  final bool obscureText;

  /// [fontSize] 字体大小
  final double fontSize;

  const QYInput({
    Key? key,
    required this.prefixIcon,
    this.fontSize = 13,
    this.obscureText = false,
    this.minLines = 1,
    this.labelText,
    this.hintText,
    this.radius = 50.0,
    this.themeColor = Colors.lightBlue,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  _QYInputState createState() => _QYInputState();
}

class _QYInputState extends State<QYInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText,
      minLines: widget.minLines,
      autofocus: widget.autoFocus,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: widget.fontSize),
        hintStyle: TextStyle(fontSize: widget.fontSize),
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: Icon(widget.prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          borderSide: BorderSide(
            color: widget.themeColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
