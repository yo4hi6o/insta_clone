import 'package:flutter/material.dart';

class ImageFromUrl extends StatelessWidget {
  final String imageUrl;

  ImageFromUrl({@required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Image.network(imageUrl),));
  }
}
