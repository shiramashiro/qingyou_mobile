// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/pages/root_page.dart';

class BootPage extends StatefulWidget {
  const BootPage({Key? key}) : super(key: key);

  @override
  State<BootPage> createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {
  var currentTime = 6;
  var timer;

  @override
  void initState() {
    super.initState();

    // 这是指定时间之后执行因此，而不是每隔几秒执行依次。
    // Timer(Duration(seconds: 6), () {});

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime--;
      });
      if (currentTime <= 0) {
        timer.cancel();
        routePage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold 是一个容器
    return Scaffold(
      // Stack 叠层布局，也就是说不是上下排列，也不是左右排列，而是依次叠加排列。与 Positioned 布局结合就可以实现任意位置排列组件。
      body: Stack(
        children: <Widget>[
          Image(
            // AssetImage 用于加载本地图片，而NetworkImage 用于加载网络图片
            image: AssetImage('assets/images/95581202_p0.jpg'),
            fit: BoxFit.cover,
            // MediaQuery 查询设备屏幕相关的信息
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              right: 10,
              child: Listener(
                child: cicrleButton(
                  opacity: 0.65,
                ),
                onPointerDown: (PointerEvent pointerEvent) {
                  routePage();
                },
              )),
        ],
      ),
    );
  }

  void routePage() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return RootPage();
    }), (route) => false);
  }

  Widget cicrleButton(
      {double opacity = 0.5, int buttonWidth = 50, int buttonHeight = 50}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Opacity(
        opacity: opacity,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.black,
          // Column 虽然是列的意思，但是是以上下排列子组件的。Row 与之相反。
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '跳过',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                '${currentTime}s',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
