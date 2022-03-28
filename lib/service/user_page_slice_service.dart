import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qingyuo_mobile/apis/upload_api.dart';
import 'package:qingyuo_mobile/apis/http/http_response.dart';
import 'package:qingyuo_mobile/models/user_model.dart';
import 'package:qingyuo_mobile/providers/user_provider.dart';

class UserPageSliceService {
  final ImagePicker _picker = ImagePicker();
  final UploadAPI _api = UploadAPI();

  void updateAvatar(
    int uid,
    String uname, {
    required BuildContext context,
  }) async {
    XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      HttpResponse().handleFutureByLoading(
        onFutureBefore: () => EasyLoading.show(status: '上传中...'),
        doFuture: _api.updateAvatar(FormData.fromMap({
          'uid': uid,
          'uname': uname,
          'file': await MultipartFile.fromFile(img.path, filename: img.name),
        })),
        onFutureSuccess: (e) {
          context.read<UserProvider>().setUser(User(avatar: e['data']));
        },
      );
    }
  }
}
