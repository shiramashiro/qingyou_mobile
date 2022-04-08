import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/utils/callbacks.dart';

class TextIcon extends StatelessWidget {
  final double holeSize;
  final double iconSize;
  final double fontSize;
  final String text;
  final String? iconPath;
  final IconData? icon;
  final Color textColor;
  final OnTap? onTap;

  const TextIcon({
    Key? key,
    this.iconPath,
    this.icon,
    this.holeSize = 55,
    this.iconSize = 30,
    required this.text,
    this.textColor = Colors.grey,
    this.fontSize = 12,
    this.onTap,
  }) : super(key: key);

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
            iconPath == null
                ? Icon(icon, size: iconSize)
                : Image(
                    image: AssetImage(iconPath!),
                    width: iconSize,
                    height: iconSize,
                  ),
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
