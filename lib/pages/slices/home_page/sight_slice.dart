import 'package:flutter/material.dart';

class SightSlice extends StatefulWidget {
  const SightSlice({Key? key}) : super(key: key);

  @override
  State<SightSlice> createState() => _SightSliceState();
}

class _SightSliceState extends State<SightSlice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('美景'),
    );
  }
}
