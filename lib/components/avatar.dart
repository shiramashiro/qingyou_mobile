import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/utils/detection.dart';

typedef OnTap = void Function();

class Avatar extends StatelessWidget {
  final double size;
  final String url;
  final OnTap? onTap;

  const Avatar({
    Key? key,
    this.onTap,
    this.size = 100,
    required this.url,
  }) : super(key: key);

  ImageProvider _createImage() {
    if (Detection.detectUrl(url)) {
      return NetworkImage(url);
    } else {
      return AssetImage(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: CircleAvatar(
          backgroundImage: _createImage(),
        ),
      ),
    );
  }
}
