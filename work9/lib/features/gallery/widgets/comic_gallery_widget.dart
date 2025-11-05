import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ComicGalleryWidget extends StatelessWidget {
  final List<String> imageUrls;

  const ComicGalleryWidget({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: imageUrls.map((url) {
        return CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        );
      }).toList(),
    );
  }
}