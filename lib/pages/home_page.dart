import 'package:flutter/material.dart';

import 'package:qingyuo_mobile/components/avatar.dart';
import 'package:qingyuo_mobile/components/clickable_icon.dart';
import 'package:qingyuo_mobile/components/icon_in_input.dart';
import 'package:qingyuo_mobile/slices/root_page/hotpost_slice.dart';
import 'package:qingyuo_mobile/slices/root_page/hotvideo_slice.dart';
import 'package:qingyuo_mobile/slices/root_page/recommend_slice.dart';
import 'package:qingyuo_mobile/slices/root_page/sight_slice.dart';
import 'package:qingyuo_mobile/slices/root_page/tech_slice.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _createTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Avatar(url: "assets/images/95893409_p0.jpg", size: 40),
        const IconInInput(
          hintText: '输入你想要搜索的内容',
          contentStyle: TextStyle(fontSize: 12),
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        ClickableIcon(onTap: () {}, icon: Icons.camera),
        ClickableIcon(onTap: () {}, icon: Icons.email)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(147, 181, 207, 6),
          title: _createTitle(),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [Text('热门贴子'), Text('推荐'), Text('热门视频'), Text('美景'), Text('技术')],
          ),
        ),
        body: const TabBarView(
          children: [
            HotpostSlice(),
            RecommendSlice(),
            HotvideoSlice(),
            SightSlice(),
            TechSlice(),
          ],
        ),
      ),
    );
  }
}
