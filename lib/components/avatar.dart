import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/utils/callbacks.dart';
import 'package:qingyuo_mobile/utils/detection.dart';

/// 头像
class Avatar extends StatefulWidget {
  final double size;
  final String url;
  final OnTap? onTap;

  const Avatar({
    Key? key,
    this.onTap,
    this.size = 100,
    required this.url,
  }) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  Widget _createImage() {
    String url = widget.url;
    if (Detection.detectUrl(url)) {
      NetworkImage image = NetworkImage(url);
      image.evict();
      return Image(image: image, fit: BoxFit.cover);
    } else {
      return Image.asset(url, fit: BoxFit.cover);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: _createImage(),
        ),
      ),
    );
  }
}
