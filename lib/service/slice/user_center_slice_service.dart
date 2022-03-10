import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qingyuo_mobile/providers/picture_provider.dart';

class UserCenterSliceService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> _pickImage() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  void setImage(BuildContext context) {
    context.read<PictureProvider>().setImage(_pickImage());
  }

  dynamic getImage(BuildContext context) {
    dynamic image = context.watch<PictureProvider>().getImage;
    if (image == null) return "不能为空！！！";
    return image;
  }
}
