import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;
  final String url;

  const Avatar({Key? key, this.size = 100, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircleAvatar(
        backgroundImage: AssetImage(url),
      ),
    );
  }
}
