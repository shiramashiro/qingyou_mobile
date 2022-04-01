import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qingyuo_mobile/apis/http/http_response.dart';
import 'package:qingyuo_mobile/apis/upload_api.dart';

class AvatarPreviewService {
  final ImagePicker _picker = ImagePicker();
  final UploadAPI _api = UploadAPI();

  void updateAvatar(
    int uid,
    String uname, {
    required BuildContext context,
  }) async {
    XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      var file = await MultipartFile.fromFile(img.path, filename: img.name);
      HttpResponse().handleFutureByLoading(
        onBefore: () => EasyLoading.show(status: '上传中...'),
        onDoing: _api.updateAvatar(FormData.fromMap({'uid': uid, 'uname': uname, 'file': file})),
        onSuccess: (e) {},
      );
    }
  }
}
