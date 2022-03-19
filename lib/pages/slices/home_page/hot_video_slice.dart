import 'package:flutter/material.dart';

class HotVideoSlice extends StatefulWidget {
  const HotVideoSlice({Key? key}) : super(key: key);

  @override
  State<HotVideoSlice> createState() => _HotVideoSliceState();
}

class _HotVideoSliceState extends State<HotVideoSlice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("热门视频"),
    );
  }
}
