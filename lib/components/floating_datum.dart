import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/decoration/decoration.dart';

class FloatingDatumTitle extends StatelessWidget {
  final BoxPropertiesDecoration decoration;
  final Widget title;

  final BoxPropertiesInjection _injection = BoxPropertiesInjection();

  FloatingDatumTitle({
    Key? key,
    required this.decoration,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _injection.padding(decoration),
      margin: _injection.margin(decoration),
      child: title,
    );
  }
}

class FloatingDatum extends StatelessWidget {
  final Widget child;
  final Color color;
  final double radius;
  final FloatingDatumTitle? title;
  final BoxPropertiesDecoration decoration;

  final BoxPropertiesInjection _injection = BoxPropertiesInjection();

  FloatingDatum({
    Key? key,
    required this.decoration,
    required this.child,
    this.color = Colors.white,
    this.radius = 10,
    this.title,
  }) : super(key: key);

  Widget _createTitle() {
    if (title != null) {
      return title!;
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: _injection.padding(decoration),
      margin: _injection.margin(decoration),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_createTitle(), child],
      ),
    );
  }
}
