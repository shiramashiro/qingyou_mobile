import 'package:flutter/material.dart';

class QYButtonCircle extends StatefulWidget {
  ///[onTap] 点击按钮时触发的函数
  final Function onTap;

  ///[highlightColor] 水波纹颜色
  final Color highlightColor;

  ///[buttonText] 按钮文本
  final String buttonText;

  ///[textStyle] 按钮文本样式
  final TextStyle? textStyle;

  ///[size] 按钮大小
  final double size;

  ///[margin] 按钮外边距
  final EdgeInsets? margin;

  ///[borderSize] 按钮内边框大小
  final double borderSize;

  ///[borderColor] 按钮内边距颜色
  final Color borderColor;

  const QYButtonCircle(
    this.buttonText, {
    Key? key,
    required this.onTap,
    this.borderSize = 2,
    this.borderColor = const Color.fromRGBO(50, 50, 50, 0.5),
    this.textStyle,
    this.margin,
    this.size = 60,
    this.highlightColor = const Color.fromRGBO(3, 169, 244, 0.25),
  }) : super(key: key);

  @override
  _QYButtonCircleState createState() => _QYButtonCircleState();
}

class _QYButtonCircleState extends State<QYButtonCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Center(
        child: ClipOval(
          child: InkWell(
            onTap: widget.onTap(),
            borderRadius: BorderRadius.circular(50.0),
            highlightColor: widget.highlightColor,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  width: widget.borderSize,
                  color: widget.borderColor,
                ),
              ),
              child: Center(
                child: Text(
                  widget.buttonText,
                  style: widget.textStyle,
                ),
              ),
              width: widget.size,
              height: widget.size,
            ),
          ),
        ),
      ),
    );
  }
}
