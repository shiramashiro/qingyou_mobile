import 'package:flutter/material.dart';

class QYAvatar extends StatelessWidget {
  /// [uri] 头像的图片地址
  final ImageProvider uri;

  /// [fit] 头像的图片裁剪
  final BoxFit fit;

  /// [size] 头像大小
  final double size;

  const QYAvatar(
      {Key? key, required this.uri, this.fit = BoxFit.cover, this.size = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image(
        image: uri,
        width: size,
        height: size,
        fit: fit,
      ),
    );
  }
}
