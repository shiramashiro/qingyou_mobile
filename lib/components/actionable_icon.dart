import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qingyuo_mobile/utils/callbacks.dart';
import 'package:qingyuo_mobile/utils/detection.dart';

/// 多功能图标
class ActionableIcon extends StatelessWidget {
  final double holeSize;
  final double iconSize;
  final double fontSize;
  final String? text;
  final String path;
  final Color textColor;
  final OnTap? onTap;
  final Color? svgColor;

  const ActionableIcon({
    Key? key,
    required this.path,
    this.text,
    this.holeSize = 55,
    this.iconSize = 30,
    this.fontSize = 12,
    this.svgColor,
    this.textColor = Colors.grey,
    this.onTap,
  }) : super(key: key);

  Widget _createIcon() {
    Widget result = Container();
    if (Detection.detectSvg(path)) {
      result = SvgPicture.asset(
        path,
        width: iconSize,
        height: iconSize,
        color: svgColor,
        fit: BoxFit.cover,
      );
    } else {
      result = Image(
        image: AssetImage(path),
        fit: BoxFit.cover,
        width: iconSize,
        height: iconSize,
      );
    }
    return result;
  }

  Widget _createText() {
    Widget result = Container();
    if (text != null) {
      result = Text(
        text!,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: holeSize,
        height: holeSize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _createIcon(),
            _createText(),
          ],
        ),
      ),
    );
  }
}
