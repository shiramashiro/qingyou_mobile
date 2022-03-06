import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  final double holeSize;
  final double iconSize;
  final double fontSize;
  final String text;
  final String imagePath;
  final Color textColor;
  final Function? onTap;

  const TextIcon({
    Key? key,
    required this.imagePath,
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
      onTap: () => onTap!(),
      child: SizedBox(
        width: holeSize,
        height: holeSize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(imagePath),
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
