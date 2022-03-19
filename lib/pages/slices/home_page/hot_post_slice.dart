import 'package:flutter/material.dart';

class HotPostSlice extends StatefulWidget {
  const HotPostSlice({Key? key}) : super(key: key);

  @override
  State<HotPostSlice> createState() => _HotPostSliceState();
}

class _HotPostSliceState extends State<HotPostSlice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("热门帖子"),
    );
  }
}
