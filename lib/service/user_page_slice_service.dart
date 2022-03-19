import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qingyuo_mobile/apis/upload_api.dart';

class UserCenterSliceService {
  final ImagePicker _picker = ImagePicker();
  final UploadApi _api = UploadApi();

  void uploadAvatar(int id, String uname) async {
    XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    if (img == null) return;
    MultipartFile file = await MultipartFile.fromFile(img.path, filename: img.name);
    FormData formData = FormData.fromMap({'uid': id, 'uname': uname, 'file': file});
    _api.uploadAvatar(formData);
  }
}
