import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/decoration/decoration.dart';
import 'package:qingyuo_mobile/utils/callbacks.dart';

class RevisionElevatedButton extends StatelessWidget {
  RevisionElevatedButton({
    Key? key,
    this.onTap,
    this.radius = 10,
    required this.text,
    required this.decoration,
  }) : super(key: key);

  final String text;
  final double radius;
  final OnTap? onTap;
  final BoxPropertiesDecoration decoration;
  final BoxPropertiesInjection _injection = BoxPropertiesInjection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _injection.margin(decoration),
      child: ElevatedButton(
        child: Text(text),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))),
        ),
        onPressed: onTap,
      ),
    );
  }
}
