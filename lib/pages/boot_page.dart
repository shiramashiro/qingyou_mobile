import 'dart:async';

import 'package:qingyuo_mobile/utils/roadmap.dart';
import 'package:flutter/material.dart';

import 'root_page.dart';

class BootPage extends StatefulWidget {
  const BootPage({Key? key}) : super(key: key);

  @override
  State<BootPage> createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {
  int currentTime = 1;
  late Timer timer;

  void router() {
    timer.cancel();
    Roadmap.push(context, const RootPage());
  }

  Widget countdownButton(
      {double opacity = 0.5, int buttonWidth = 50, int buttonHeight = 50}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Opacity(
        opacity: opacity,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                '跳过',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                '${currentTime}s',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentTime--;
      });
      if (currentTime <= 0) {
        router();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(
            image: const AssetImage('assets/images/boot_bg.jpg'),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: GestureDetector(
              child: countdownButton(
                opacity: 0.65,
              ),
              onTap: () {
                router();
              },
            ),
          ),
        ],
      ),
    );
  }
}
