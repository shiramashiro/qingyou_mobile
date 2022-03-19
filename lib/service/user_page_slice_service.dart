import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qingyuo_mobile/apis/upload_api.dart';
import 'package:qingyuo_mobile/apis/utils/http_response.dart';

class UserPageSliceService {
  final ImagePicker _picker = ImagePicker();
  final UploadApi _api = UploadApi();

  void updateAvatar(int id, String uname) async {
    XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      HttpResponse().handleFutureByLoading(
        onFutureBefore: () => EasyLoading.show(status: '上传中...'),
        doFuture: _api.updateAvatar(FormData.fromMap({
          'uid': id,
          'uname': uname,
          'file': await MultipartFile.fromFile(img.path, filename: img.name),
        })),
        onFutureSuccess: (e) {
          // 将照片存入provider
          print(e);
        }
      );

    }
  }
}
