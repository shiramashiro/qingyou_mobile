import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Function onTap;

  const CircleButton({Key? key, required this.onTap}) : super(key: key);

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
      child: const Text(
        '登录',
        style: TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
    );
  }
}
