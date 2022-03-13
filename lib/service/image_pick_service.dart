import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qingyuo_mobile/providers/image_pick_provider.dart';

class ImagePickService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> _pickImage() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  void setImage(BuildContext context) {
    context.read<ImagePickProvider>().setImage(_pickImage());
  }

  dynamic getImage(BuildContext context) {
    dynamic image = context.watch<ImagePickProvider>().getImage;
    if (image == null) return "不能为空！！！";
    return image;
  }
}
