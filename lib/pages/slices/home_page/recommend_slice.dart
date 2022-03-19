import 'package:flutter/material.dart';

class RecommendSlice extends StatefulWidget {
  const RecommendSlice({Key? key}) : super(key: key);

  @override
  State<RecommendSlice> createState() => _RecommendSliceState();
}

class _RecommendSliceState extends State<RecommendSlice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('推荐'),
    );
  }
}
