import 'package:flutter/material.dart';

class HotpostSlice extends StatefulWidget {
  const HotpostSlice({Key? key}) : super(key: key);

  @override
  State<HotpostSlice> createState() => _HotpostSliceState();
}

class _HotpostSliceState extends State<HotpostSlice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("热门帖子"),
    );
  }
}
