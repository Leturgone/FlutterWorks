
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:work12/core/models/impression_note.dart';
import '../store/impression_notes_list_store.dart';
import '../widgets/impression_note_list_view.dart';


class ImpressionNoteListScreen extends StatelessWidget {
  ImpressionNoteListScreen({super.key}){
    store.loadNoteList();
  }

  final store = ImpressionNotesListStore();
  @override
  Widget build(BuildContext context) {

    void onAdd(ImpressionNotesListStore store) {
      final notes = store.impressionNotes ?? [];
      final newId = notes.isNotEmpty ? notes.last.id + 1 : 1;
      final args = {
        'id': newId,
        'store': store
      };
      context.push('/note/add', extra: args);
    }
    void onNoteTap(ImpressionNote note) {
      context.push('/note/about', extra: note.id);
    }
    void onEdit(ImpressionNote note) {
      final args = {'id': note.id, 'impressionNote': note,};
      context.push('/note/edit', extra: args);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Заметки о впечатлениях'),
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ImpressionNoteListView(
            notes: store.impressionNotes ?? [],
            onDelete: (id) => store.removeNote(id),
            onNoteTap:  onNoteTap,
            onEdit: onEdit,
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'fab1',
            onPressed: () => onAdd(store),
            tooltip: 'Добавить заметку',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'fab2',
            onPressed: () => store.sort(),
            tooltip: 'Сортировать',
            child: const Icon(Icons.sort_by_alpha),
          ),
        ],
      ),
    );
  }
}