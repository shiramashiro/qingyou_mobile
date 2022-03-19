import 'package:flutter/material.dart';

typedef OnTap = void Function();

class Avatar extends StatelessWidget {
  final double size;
  final String url;
  final OnTap? onTap;

  const Avatar({
    Key? key,
    this.size = 100,
    required this.url,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: CircleAvatar(
          backgroundImage: AssetImage(url),
        ),
      ),
    );
  }
}
