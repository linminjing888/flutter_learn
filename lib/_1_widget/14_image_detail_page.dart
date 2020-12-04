import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  final String _imageUrl;
  ImageDetailPage(this._imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          child: Hero(
            tag: _imageUrl,
            child: Image.network(_imageUrl),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
