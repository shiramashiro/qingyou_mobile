import 'package:flutter/material.dart';

class IconInInput extends StatelessWidget {
  final double width;
  final double height;
  final IconData icon;
  final Color iconColor;
  final double radius;
  final String hintText;
  final Color hintColor;
  final double borderHeight;
  final Color borderColor;
  final double tbPadding;
  final double leftPadding;
  final double rightPadding;
  final TextStyle? hintStyle;
  final TextStyle? contentStyle;

  const IconInInput({
    Key? key,
    required this.hintText,
    this.icon = Icons.search,
    this.height = 30,
    this.width = 200,
    this.iconColor = Colors.black45,
    this.radius = 50,
    this.hintColor = Colors.grey,
    this.borderHeight = 0,
    this.borderColor = Colors.white,
    this.tbPadding = 5,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.hintStyle,
    this.contentStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height - 10,
                width: height - 10,
                child: Icon(
                  icon,
                  color: iconColor,
                  size: height - 10,
                ),
              ),
              SizedBox(
                height: height,
                width: width - 20,
                child: TextField(
                  minLines: 1,
                  style: contentStyle,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: hintStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(radius)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(radius)),
                      borderSide: BorderSide(color: borderColor, width: borderHeight),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(radius)),
                      borderSide: BorderSide(color: borderColor, width: borderHeight),
                    ),
                    contentPadding: EdgeInsets.only(
                      left: leftPadding,
                      right: rightPadding,
                      top: tbPadding,
                      bottom: tbPadding,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
