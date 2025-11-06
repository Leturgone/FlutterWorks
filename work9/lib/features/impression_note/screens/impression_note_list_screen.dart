
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:work9/features/impression_note/models/impression_note.dart';
import 'package:work9/features/impression_note/state/impression_notes_store.dart';
import 'package:work9/features/impression_note/widgets/impression_note_list_view.dart';

class ImpressionNoteListScreen extends StatefulWidget {

  const ImpressionNoteListScreen({super.key});

  @override
  _ImpressionNoteListScreenState createState() => _ImpressionNoteListScreenState();
}

class _ImpressionNoteListScreenState extends State<ImpressionNoteListScreen> {
  late ImpressionNotesStore impressionNotesStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    impressionNotesStore = GetIt.I<ImpressionNotesStore>();
  }

  // Функция удаления
  void onDelete(int id){
    setState(() {
      impressionNotesStore.removeNote(id);
    });
  }

  // Функция сортировки
  void onSort() {
    setState(() {
      impressionNotesStore.impressionNotes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    });
  }

  void onNoteTap(ImpressionNote note) {
    context.push('/note/about', extra: note);
  }


  // Обработка редактирования заметки
  void onEdit(ImpressionNote note) {
    final args = {
      'id': note.id,
      'impressionNote': note,
    };
    context.push('/note/edit', extra: args);
  }

  // Добавление новой заметки
  void onAdd() {
    final newId = impressionNotesStore.impressionNotes.lastOrNull != null ? impressionNotesStore.impressionNotes.lastOrNull!.id + 1 : 1;
    final args = {
      'id': newId,
    };
    context.push('/note/add', extra: args);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {context.pop();},
        ),
        title: Text('Заметки о впечатлениях'),

      ),
      body: Observer(
          builder: (_) => ImpressionNoteListView(
            notes: impressionNotesStore.impressionNotes,
            onDelete: onDelete,
            onNoteTap: onNoteTap,
            onEdit: onEdit,
          )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'fab1',
            onPressed: onAdd,
            tooltip: 'Добавить заметку',
            child: const Icon(Icons.add),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'fab2',
            onPressed: onSort,
            tooltip: 'Сортировать',
            child: const Icon(Icons.sort_by_alpha),
          ),
        ],
      ),
    );
  }
}