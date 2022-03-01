import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/pages/login_page.dart';

class BootPage extends StatefulWidget {
  const BootPage({Key? key}) : super(key: key);

  @override
  State<BootPage> createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {
  /// [currentTime] 初始值为 6 秒
  int currentTime = 1;

  /// 使用未初始化的值有错误提示。因此，用?可空类型或late关键字来避免
  late Timer timer;

  void router() {
    timer.cancel();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const LoginPage()),
        (route) => false);
  }

  /// 倒计时按钮。
  /// ClipRRect：裁剪组件，用于裁剪子组件形状。
  ///
  /// [opacity] 按钮透明度
  /// [buttonWidth] 按钮宽度
  /// [buttonHeight] 按钮高度
  Widget countdownButton(
      {double opacity = 0.5, int buttonWidth = 50, int buttonHeight = 50}) {
    return ClipRRect(
      // 边框弧度.
      borderRadius: BorderRadius.circular(50),
      // Opacity：透明度组件，可以设置组件的透明度.
      child: Opacity(
        // 透明度的默认值为0.5
        opacity: opacity,
        // Container：DecoratedBox、ConstrainedBox、Transform、Padding、Align等组件组合的一个多功能容器。
        child: Container(
          width: 50,
          height: 50,
          color: Colors.black,
          // Column 是上下排列；Row 是左右排列。Column 和 Row 都是流式布局组件。
          child: Column(
            // 元素沿着主轴对齐的方式。
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

    /// Timer()：到达时间后执行依次；
    /// Timer.periodic()：每隔多少秒执行一次。
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
    // Scaffold：包含导航栏、抽屉菜单以及底部导航菜单的容器，通过配置可以实现导航栏之类的UI。
    return Scaffold(
      // Stack：叠层布局，既不是上下排列，也不是左右排列，而是依次叠加排列。与 Positioned 布局结合就可以实现任意位置排列组件。
      body: Stack(
        children: <Widget>[
          Image(
            // AssetImage 用于加载本地图片；NetworkImage 用于加载网络图片
            image: const AssetImage('assets/images/boot_bg.jpg'),
            fit: BoxFit.cover,
            // MediaQuery：查询设备屏幕相关的信息
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            //Positioned：主要用 top 和 right 来定位位置。
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
