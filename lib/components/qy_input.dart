import 'package:flutter/material.dart';

class QYInput extends StatefulWidget {
  final int minLines;
  final String? labelText;
  final String? hintText;
  final double radius;
  final Color color;
  final bool autoFocus;
  final IconData prefixIcon;
  final bool obscureText;

  const QYInput(
    this.prefixIcon, {
    Key? key,
    this.obscureText = false,
    this.minLines = 1,
    this.labelText,
    this.hintText,
    this.radius = 50.0,
    this.color = Colors.lightBlue,
    this.autoFocus = true,
  }) : super(key: key);

  @override
  _QYInputState createState() => _QYInputState();
}

class _QYInputState extends State<QYInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText,
      minLines: widget.minLines,
      autofocus: widget.autoFocus,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: Icon(widget.prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          borderSide: BorderSide(
            color: widget.color,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
