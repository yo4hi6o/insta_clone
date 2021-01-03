
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CirclePhoto extends StatelessWidget {
  final String photoUrl;
  final double radius;
  final bool isImageFromFile;

  CirclePhoto({@required this.photoUrl, this.radius, @required this.isImageFromFile});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: isImageFromFile
        ? FileImage(File(photoUrl))
        : CachedNetworkImageProvider(
        photoUrl
      ),
    );
  }
}
