import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qingyuo_mobile/utils/callbacks.dart';

class TextIcon extends StatelessWidget {
  final double holeSize;
  final double iconSize;
  final double fontSize;
  final String text;
  final String iconPath;
  final Color textColor;
  final OnTap? onTap;
  final String? iconType;
  final Color? svgColor;

  const TextIcon({
    Key? key,
    this.iconType = "normal",
    required this.iconPath,
    required this.text,
    this.holeSize = 55,
    this.iconSize = 30,
    this.fontSize = 12,
    this.svgColor,
    this.textColor = Colors.grey,
    this.onTap,
  }) : super(key: key);

  Widget _createIcon() {
    Widget result = Container();
    if (iconType == 'svg') {
      result = SvgPicture.asset(
        iconPath,
        width: iconSize,
        height: iconSize,
        color: svgColor,
        semanticsLabel: 'a svg.',
      );
    } else if (iconType == 'normal') {
      result = Image(
        image: AssetImage(iconPath),
        width: iconSize,
        height: iconSize,
      );
    }
    return Container(child: result);
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
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
