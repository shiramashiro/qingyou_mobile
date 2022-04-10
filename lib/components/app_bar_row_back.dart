import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/utils/roadmap.dart';

/// AppBar 返回以及标题
class AppBarRowBack extends StatelessWidget {
  final Widget widget;
  final String title;

  const AppBarRowBack({Key? key, required this.widget, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            Roadmap.push(context, widget);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        Text(title),
      ],
    );
  }
}
