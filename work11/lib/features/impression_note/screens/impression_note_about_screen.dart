import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:work11/features/impression_note/store/impression_note_about_store.dart';
import 'package:work11/features/impression_note/widgets/impression_note_about_view.dart';


class ImpressionNoteAboutScreen extends StatelessWidget {
  final ImpressionNoteAboutStore store = ImpressionNoteAboutStore();
  final int noteId;
  ImpressionNoteAboutScreen({super.key, required this.noteId}){
    store.loadNoteById(noteId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {context.pop();},
        ),
        title: Text('О заметке о впечатлении'),
      ),
        body: Observer(
            builder:  (_) {
              if (store.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              final impressionNote = store.impressionNote;
              if (impressionNote == null) {
                return Center(child: Text('Нет данных'));
              }
              return ImpressionNoteAboutView(impressionNote: impressionNote);
            }
        )
    );
  }
}