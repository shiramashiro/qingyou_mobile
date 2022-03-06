import 'package:flutter/material.dart';

class HotvideoSlice extends StatefulWidget {
  const HotvideoSlice({Key? key}) : super(key: key);

  @override
  State<HotvideoSlice> createState() => _HotvideoSliceState();
}

class _HotvideoSliceState extends State<HotvideoSlice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("热门视频"),
    );
  }
}
