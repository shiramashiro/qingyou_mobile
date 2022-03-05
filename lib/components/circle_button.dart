import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Function onTap;
  final String text;

  const CircleButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(20),
      shape: const CircleBorder(
        side: BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      ),
      onPressed: () => onTap(),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
    );
  }
}
