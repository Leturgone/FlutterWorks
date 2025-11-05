import 'package:flutter/material.dart';
import 'package:work9/features/impression_note/models/impression_note.dart';

class ImpressionNoteAboutView extends StatelessWidget {
  final ImpressionNote impressionNote;

  const ImpressionNoteAboutView({
    super.key,
    required this.impressionNote,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              impressionNote.seriesImage,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Запись ${impressionNote.id}',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(
              'Дата ${impressionNote.createdAt}',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                impressionNote.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}