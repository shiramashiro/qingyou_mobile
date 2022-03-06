import 'package:flutter/material.dart';

class TechSlice extends StatefulWidget {
  const TechSlice({Key? key}) : super(key: key);

  @override
  State<TechSlice> createState() => _TechSliceState();
}

class _TechSliceState extends State<TechSlice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('技术'),
    );
  }
}
