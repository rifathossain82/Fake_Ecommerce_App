import 'dart:io';

import 'package:fake_ecommerce_app/src/core/helpers/helper_methods.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageServices{

  static Future galleryImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      return image ;
    } on PlatformException catch (e) {
      kPrint('Failed to pick image: $e');
    }
  }

  static Future cameraImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      return image;
    } on PlatformException catch (e) {
      kPrint('Failed to pick image: $e');
    }
  }

  static String getImagePath(File image){
    return File(image.path).path;
  }

  static Future getImageFile(XFile image)async{
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(image.path);
    final fileImage = File('${directory.path}/$name');

    return File(image.path).copy(fileImage.path);
  }

}