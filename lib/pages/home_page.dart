import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/actionable_icon.dart';

import 'package:qingyuo_mobile/components/avatar.dart';
import 'package:qingyuo_mobile/components/icon_in_input.dart';
import 'package:qingyuo_mobile/pages/slices/home_page/hot_post_slice.dart';
import 'package:qingyuo_mobile/pages/slices/home_page/hot_video_slice.dart';
import 'package:qingyuo_mobile/pages/slices/home_page/recommend_slice.dart';
import 'package:qingyuo_mobile/pages/slices/home_page/sight_slice.dart';
import 'package:qingyuo_mobile/pages/slices/home_page/tech_slice.dart';
import 'package:qingyuo_mobile/pages/slices/user_page/user_profile.dart';
import 'package:qingyuo_mobile/service/home_page_service.dart';
import 'package:qingyuo_mobile/utils/roadmap.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageService _service = HomePageService();
  Map<String, Object?> _userData = {'avatar': 'assets/images/95893409_p0.jpg'};

  @override
  void initState() {
    super.initState();
    _setUserData();
  }

  _setUserData() async {
    var userData = await _service.getUser(where: ['avatar']);
    setState(() {
      _userData = userData;
    });
  }

  Widget _createTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Avatar(
          url: _userData['avatar'].toString(),
          size: 40,
          onTap: () {
            Roadmap.push(context, const UserProfile());
          },
        ),
        const IconInInput(
          hintText: '输入你想要搜索的内容',
          contentStyle: TextStyle(fontSize: 12),
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        const ActionableIcon(path: "assets/icons/pick_image.svg", holeSize: 30),
        const ActionableIcon(path: "assets/icons/message.svg", holeSize: 30),
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
          title: _createTitle(),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [Text('热门贴子'), Text('推荐'), Text('热门视频'), Text('美景'), Text('技术')],
          ),
        ),
        body: const TabBarView(
          children: [
            HotPostSlice(),
            RecommendSlice(),
            HotVideoSlice(),
            SightSlice(),
            TechSlice(),
          ],
        ),
      ),
    );
  }
}
