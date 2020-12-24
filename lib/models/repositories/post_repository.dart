import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/utils/constants.dart';

class PostRepository {

  //コンストラクタtodo

  Future<File> pickImage(UploadType uploadType) async {
    final imagePicker = ImagePicker();

    if (uploadType == UploadType.GALLERY){
      final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
      return File(pickedImage.path);
    }else{
      final pickedImage = await imagePicker.getImage(source: ImageSource.camera);
      return File(pickedImage.path);
    }
  }
  //todo
}