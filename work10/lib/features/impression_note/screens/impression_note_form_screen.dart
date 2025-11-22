
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../models/impression_note.dart';
import '../store/impression_note_form_store.dart';
import '../widgets/impression_note_form_view.dart';

class ImpressionNoteFormScreen extends StatelessWidget {
  final int id;
  final ImpressionNote? impressionNote;
  final String? selectedCover;

  const ImpressionNoteFormScreen({
    super.key,
    this.impressionNote,
    this.selectedCover,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final store = ImpressionNoteFormStore();

    if( selectedCover!=null) store.setSeriesCover(selectedCover);
    if (impressionNote!=null) store.seData(impressionNote!);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text('Форма заметки о впечатлении'),
      ),
      body: Center(
        child: Observer(builder: (_) => SingleChildScrollView(
          child: ImpressionNoteForm(
            description: store.description,
            seriesCover: store.seriesCover,
            coverError: store.coverError,
            descriptionError: store.descriptionError,
            onImageTapComic: () => _onImageTap(context, store, "comic_series"),
            onImageTapGame: () => _onImageTap(context, store, "game"),
            onImageTapMovie: () => _onImageTap(context, store, "movie"),
            onDescriptionChanged: store.setDescription,
            onSave: () => _save(context, store),
            onCancel: () => context.pop(),
          ),
        ),
        )
      )
    );
  }


  void _onImageTap(BuildContext context, ImpressionNoteFormStore store, String cat) {
    if (store.seriesCover == null || store.seriesCover!.isEmpty) {
      context.push('/${cat}_choose', extra: (String selectedImage) {
        final args = {
          'id': id,
          'selectedCover': selectedImage,
        };
        context.pushReplacement('/note/add/image', extra: args);
      });
    }
  }

  void _save(BuildContext context, ImpressionNoteFormStore store) {
    if (!store.validate()) {
      return;
    }

    if (impressionNote != null) {
      store.updateNote(
        id,
        impressionNote!,
        store.description,
        store.seriesCover ?? '',
      );
    } else {
      final newImpressionNote = ImpressionNote(
        id: id,
        image: store.seriesCover ?? '',
        description: store.description,
        createdAt: DateTime.now(),
      );
      store.addNote(newImpressionNote);
    }

    context.pushReplacement('/im_notes');
  }
}