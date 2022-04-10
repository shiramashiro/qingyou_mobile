import 'package:flutter/material.dart';

class FloatingDatum extends StatelessWidget {
  final Widget child;
  final double mtop;
  final double mleft;
  final double mright;
  final double mbottom;
  final double ptop;
  final double pleft;
  final double pright;
  final double pbottom;
  final Color color;
  final double radius;
  final double? padding;

  const FloatingDatum({
    Key? key,
    required this.child,
    this.color = Colors.white,
    this.mtop = 0,
    this.mleft = 0,
    this.mright = 0,
    this.mbottom = 0,
    this.ptop = 0,
    this.pleft = 0,
    this.pright = 0,
    this.pbottom = 0,
    this.radius = 10,
    this.padding,
  }) : super(key: key);

  EdgeInsetsGeometry _createPadding() {
    if (padding != null) {
      return EdgeInsets.all(padding!);
    } else {
      return EdgeInsets.only(
        top: ptop,
        left: pleft,
        right: pright,
        bottom: pbottom,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: _createPadding(),
      margin: EdgeInsets.only(
        top: mtop,
        left: mleft,
        right: mright,
        bottom: mbottom,
      ),
      child: child,
    );
  }
}
