import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/models/db/database_manager.dart';
import 'package:insta_clone/models/location/location_manager.dart';
import 'package:insta_clone/utils/constants.dart';

class PostRepository {
  final DatabaseManager dbManager;
  final LocationManager locationManager;

  PostRepository({this.dbManager, this.locationManager});

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