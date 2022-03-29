import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final bool obscure;
  final double fontSize;
  final String label;
  final String hint;
  final IconData icon;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;

  const FormInput({
    Key? key,
    required this.controller,
    required this.validator,
    this.obscure = false,
    this.fontSize = 14,
    required this.label,
    required this.hint,
    required this.icon,
    this.marginTop = 0,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft, top: marginTop, right: marginRight, bottom: marginBottom, ),
      height: 80,
      child: TextFormField(
        controller: controller,
        validator: (e) => validator(e),
        obscureText: obscure,
        minLines: 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(),
          labelStyle: TextStyle(fontSize: fontSize),
          hintStyle: TextStyle(fontSize: fontSize),
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(
              color: Colors.lightBlue,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
