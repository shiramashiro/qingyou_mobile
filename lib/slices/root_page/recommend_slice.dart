import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/slices/user_page/user_center_slice.dart';
import 'package:qingyuo_mobile/utils/roadmap.dart';

class RecommendSlice extends StatefulWidget {
  const RecommendSlice({Key? key}) : super(key: key);

  @override
  State<RecommendSlice> createState() => _RecommendSliceState();
}

class _RecommendSliceState extends State<RecommendSlice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          Roadmap.push(context, UserCenterSlice());
        },
        child: Text('click me'),
      ),
    );
  }
}
