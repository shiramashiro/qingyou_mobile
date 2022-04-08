import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qingyuo_mobile/apis/http/http_response.dart';
import 'package:qingyuo_mobile/apis/prefs/user_prefs.dart';
import 'package:qingyuo_mobile/apis/upload_api.dart';
import 'package:qingyuo_mobile/models/user_model.dart';

class UserProfileService {
  final ImagePicker _picker = ImagePicker();
  final UserPrefs _prefs = UserPrefs();
  final UploadAPI _api = UploadAPI();

  void updateAvatar(int uid, String uname, {required BuildContext context}) async {
    XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      var file = await MultipartFile.fromFile(img.path, filename: img.name);
      HttpResponse().handleFutureByLoading(
        onBefore: () => EasyLoading.show(status: '上传中...'),
        onDoing: _api.updateAvatar(FormData.fromMap({'uid': uid, 'uname': uname, 'file': file})),
      );
    }
  }

  Future<Map<String, Object?>> getUser({List<String>? where}) {
    return _prefs.getUser(where);
  }

  updateUname(User user) {

  }
}
