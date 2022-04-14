import 'package:flutter/material.dart';

class BoxPropertiesInjection {
  EdgeInsetsGeometry padding(BoxPropertiesDecoration decoration) {
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

  EdgeInsetsGeometry margin(BoxPropertiesDecoration decoration) {
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

class BoxPropertiesDecoration {
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

  const BoxPropertiesDecoration({
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
