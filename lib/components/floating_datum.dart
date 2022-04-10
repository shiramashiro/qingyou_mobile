import 'package:flutter/material.dart';

class FloatingDatumDecoration {
  final double mtop;
  final double mleft;
  final double mright;
  final double mbottom;
  final double ptop;
  final double pleft;
  final double pright;
  final double pbottom;
  final double padding;
  final double margin;

  const FloatingDatumDecoration({
    this.mtop = 0,
    this.mleft = 0,
    this.mright = 0,
    this.mbottom = 0,
    this.ptop = 0,
    this.pleft = 0,
    this.pright = 0,
    this.pbottom = 0,
    this.padding = 0,
    this.margin = 0,
  });
}

class FloatingDatumBox {
  EdgeInsetsGeometry padding(FloatingDatumDecoration decoration) {
    if (decoration.padding > 0) {
      return EdgeInsets.all(decoration.padding);
    } else {
      return EdgeInsets.only(
        top: decoration.ptop,
        left: decoration.pleft,
        right: decoration.pright,
        bottom: decoration.pbottom,
      );
    }
  }

  EdgeInsetsGeometry margin(FloatingDatumDecoration decoration) {
    if (decoration.margin > 0) {
      return EdgeInsets.all(decoration.margin);
    } else {
      return EdgeInsets.only(
        top: decoration.mtop,
        left: decoration.mleft,
        right: decoration.mright,
        bottom: decoration.mbottom,
      );
    }
  }
}

class FloatingDatumTitle extends StatelessWidget {
  final FloatingDatumDecoration decoration;
  final Widget title;

  final FloatingDatumBox _box = FloatingDatumBox();

  FloatingDatumTitle({
    Key? key,
    required this.decoration,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _box.padding(decoration),
      margin: _box.margin(decoration),
      child: title,
    );
  }
}

class FloatingDatum extends StatelessWidget {
  final Widget child;
  final Color color;
  final double radius;
  final FloatingDatumTitle? title;
  final FloatingDatumDecoration decoration;

  final FloatingDatumBox _box = FloatingDatumBox();

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
      padding: _box.padding(decoration),
      margin: _box.margin(decoration),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_createTitle(), child],
      ),
    );
  }
}
