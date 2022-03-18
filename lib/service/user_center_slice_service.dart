import 'package:image_picker/image_picker.dart';
import 'package:qingyuo_mobile/apis/upload_api.dart';

class UserCenterSliceService {
  final ImagePicker _picker = ImagePicker();
  final UploadApi _api = UploadApi();

  void uploadAvatar(int id, String uname) async {
    XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    _api.uploadAvatar(id, uname, file);
  }
}
