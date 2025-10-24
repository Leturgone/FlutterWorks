import 'package:flutter/material.dart';

import '../widgets/comic_gallery_widget.dart';

class ComicGalleryScreen extends StatelessWidget {

  final List<String> imageUrls;
  const ComicGalleryScreen({super.key, required this.imageUrls});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ComicGalleryWidget(imageUrls: imageUrls)
    );
  }
}