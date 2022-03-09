import 'package:flutter/material.dart';

class ClickableIcon extends StatelessWidget {
  final Function onTap;
  final String? iconPath;
  final double holeSize;
  final IconData? icon;

  const ClickableIcon({
    Key? key,
    this.holeSize = 30,
    required this.onTap,
    this.iconPath,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: SizedBox(
        width: holeSize,
        height: holeSize,
        child: iconPath == null ? Icon(icon) : Image(image: AssetImage(iconPath!)),
      ),
    );
  }
}
