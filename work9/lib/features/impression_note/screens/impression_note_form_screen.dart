


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../models/impression_note.dart';
import '../state/impression_note_form_store.dart';

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _onImageTap(context, store),
                child: Observer(
                  builder: (context) => store.seriesCover != null
                      ? Image.network(
                    store.seriesCover!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    width: 150,
                    height: 150,
                    color: Colors.grey[300],
                    child: const Icon(Icons.add_a_photo, size: 50),
                  ),
                ),
              ),
              Observer(
                builder: (context) => store.coverError != null
                    ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    store.coverError!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                )
                    : const SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Observer(
                  builder: (context) => TextField(
                    controller: TextEditingController(text: store.description)
                      ..selection = TextSelection.collapsed(
                        offset: store.description.length,
                      ),
                    onChanged: store.setDescription,
                    decoration: InputDecoration(
                      labelText: 'Впечатление',
                      border: const OutlineInputBorder(),
                      errorText: store.descriptionError,
                    ),
                    maxLines: null,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _save(context, store),
                    child: const Text('Сохранить'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => context.pop(),
                    child: const Text('Отмена'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _initializeStore(ImpressionNoteFormStore store) {
    if (impressionNote != null) {
      store.setDescription(impressionNote!.description);
      store.setSeriesCover(impressionNote!.seriesImage);
    } else if (selectedCover != null) {
      store.setSeriesCover(selectedCover!);
    }
  }

  void _onImageTap(BuildContext context, ImpressionNoteFormStore store) {
    if (store.seriesCover == null || store.seriesCover!.isEmpty) {
      context.push('/comic_series_choose', extra: (String selectedImage) {
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
        seriesImage: store.seriesCover ?? '',
        description: store.description,
        createdAt: DateTime.now(),
      );
      store.addNote(newImpressionNote);
    }

    context.pushReplacement('/im_notes');
  }
}