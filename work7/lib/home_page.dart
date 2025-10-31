import 'package:flutter/material.dart';
import 'package:work7/features/comic_series/screens/comic_series_list_screen.dart';
import 'package:work7/features/gallery/screens/comic_gallery_screen.dart';
import 'package:work7/features/impression_note/repository/impression_notes_repository.dart';
import 'package:work7/features/impression_note/screens/impression_note_list_screen.dart';
import 'package:work7/features/shared_data.dart';

class HomePage extends StatelessWidget {
  List<String> imageUrls = [
    "https://i.annihil.us/u/prod/marvel/i/mg/1/d0/519bad24bebcd.jpg",
    "https://cdn.marvel.com/u/prod/marvel/i/mg/4/90/659c61377f79c/standard_incredible.jpg",
    "https://cdn.marvel.com/u/prod/marvel/i/mg/6/f0/68c053ab8d985/standard_incredible.jpg",
    "https://cdn.marvel.com/u/prod/marvel/i/mg/4/60/68e6a1293e977/standard_incredible.jpg",
    "https://cdn.marvel.com/u/prod/marvel/i/mg/4/80/575ef36168a99/standard_incredible.jpg"
  ];
  ImpressionNoteRepository impressionNoteRepository = ImpressionNoteRepository();
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главная'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.book),
                  iconSize: 50,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) =>
                        ComicSeriesListScreen(seriesList: SharedData.seriesList,usual: true)));
                  },
                ),
                Text('Серии комиксов')
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.note),
                  iconSize: 50,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) =>
                        ImpressionNoteListScreen(impressionNoteRepository: impressionNoteRepository)));
                  },
                ),
                Text('Заметки о впечатлениях')
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.pages),
                  iconSize: 50,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ComicGalleryScreen(imageUrls: imageUrls)),
                    );
                  },
                ),
                Text('Галерея обложек')
              ],
            ),
          ],
        ),
      ),
    );
  }
}