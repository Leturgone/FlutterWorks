import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:work9/features/gallery/store/comic_gallery_store.dart';

import '../widgets/comic_gallery_widget.dart';

class ComicGalleryScreen extends StatelessWidget {

  final ComicGalleryStore store = ComicGalleryStore();

  ComicGalleryScreen({super.key}){
    store.loadSeries();
  }

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
        body: Observer(
          builder: (_) {
            if (store.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (store.coverList.isEmpty) {
              return Center(child: Text('Нет данных'));
            }
            return ComicGalleryWidget(imageUrls: store.coverList);
          },
        ),
    );
  }
}