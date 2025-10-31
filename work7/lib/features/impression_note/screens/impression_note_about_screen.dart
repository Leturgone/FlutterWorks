import 'package:flutter/material.dart';
import 'package:work7/features/impression_note/widgets/impression_note_about_view.dart';

import '../models/impression_note.dart';



class ImpressionNoteAboutScreen extends StatelessWidget {
  final ImpressionNote impressionNote;

  const ImpressionNoteAboutScreen({super.key, required this.impressionNote});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('О заметке о впечатлении'),
      ),
      body: ImpressionNoteAboutView(impressionNote: impressionNote),
    );
  }
}