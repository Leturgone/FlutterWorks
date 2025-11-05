import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/comic_gallery_widget.dart';

class ComicGalleryScreen extends StatelessWidget {

  final List<String> imageUrls;
  const ComicGalleryScreen({super.key, required this.imageUrls});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {context.pop();},
          ),
          title: Text('Галерея обложек'),
        ),
        body: ComicGalleryWidget(imageUrls: imageUrls)
    );
  }
}