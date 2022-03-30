import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/app_bar_row_back.dart';
import 'package:qingyuo_mobile/components/avatar.dart';
import 'package:qingyuo_mobile/components/circle_button.dart';
import 'package:qingyuo_mobile/pages/slices/user_page/user_profile.dart';
import 'package:qingyuo_mobile/service/slices/user_page/subslice/avatar_preview_service.dart';

class AvatarPreview extends StatefulWidget {
  const AvatarPreview({Key? key}) : super(key: key);

  @override
  State<AvatarPreview> createState() => _AvatarPreviewState();
}

class _AvatarPreviewState extends State<AvatarPreview> {
  final AvatarPreviewService _service = AvatarPreviewService();

  /// 默认图片，在网络图片没有加载出来之前，加载默认图片。
  String _imageUrl = 'assets/images/95893409_p0.jpg';

  @override
  void initState() {
    super.initState();
    _service.queryAvatar(success: (e) => _updateImageUrl(e));
  }

  _updateImageUrl(dynamic e) {
    setState(() {
      _imageUrl = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarRowBack(widget: UserProfile(), title: '头像修改'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: Avatar(
                  url: _imageUrl,
                  size: 250,
                  onTap: () {
                    _service.updateAvatar(0, 'shiramashiro', context: context);
                  },
                ),
              ),
              CircleButton(
                text: '保存头像',
                onTap: () async {
                  // 1. 点击头像选头像，然后把头像传递给后台。
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
