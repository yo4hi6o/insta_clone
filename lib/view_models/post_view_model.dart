import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/location.dart';
import 'package:insta_clone/models/repositories/post_repository.dart';
import 'package:insta_clone/models/repositories/user_repository.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:provider/provider.dart';

class PostViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final PostRepository postRepository;
  PostViewModel({this.userRepository, this.postRepository});

  File imageFile;

  Location location;
  String locationString = "";

  String caption = "";

  bool isProcessing = false;
  bool isImagePicked = false;

  Future<void> pickImage(UploadType uploadType) async{
    isImagePicked = false;
    isProcessing = true;
    notifyListeners();

    imageFile = await postRepository.pickImage(uploadType);
    print("pickedImage: ${imageFile.path}");

    location = await postRepository.getCurrentLocation();
    locationString = _toLocationString(location);
    print("location: $locationString");


    if(imageFile != null) isImagePicked = true;
    isProcessing = false;
    notifyListeners();

  }

  String _toLocationString(Location location) {
    return location.country + " " + location.state + " " + location.city;
  }


}