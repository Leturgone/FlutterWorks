
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work8/features/impression_note/models/impression_note.dart';
import 'package:work8/features/impression_note/widgets/impression_note_list_view.dart';

import '../repository/impression_notes_repository.dart';

class ImpressionNoteListScreen extends StatefulWidget {
  final ImpressionNoteRepository impressionNoteRepository;
  const ImpressionNoteListScreen({super.key, required this.impressionNoteRepository});

  @override
  _ImpressionNoteListScreenState createState() => _ImpressionNoteListScreenState();
}

class _ImpressionNoteListScreenState extends State<ImpressionNoteListScreen> {
  late List<ImpressionNote> notes;

  @override
  void initState() {
    super.initState();
    notes = List.from(widget.impressionNoteRepository.getNotes());
  }

  // Функция удаления
  void onDelete(int id){
    setState(() {
      widget.impressionNoteRepository.removeNote(id);
    });
  }

  // Функция сортировки
  void onSort() {
    setState(() {
      notes.sort((a, b) => a.createdAt.compareTo(b.createdAt));
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
      'impressionNoteRepository': widget.impressionNoteRepository,
    };
    context.push('/note/edit', extra: args);
  }

  // Добавление новой заметки
  void onAdd() {
    final newId = notes.lastOrNull != null ? notes.lastOrNull!.id + 1 : 1;
    final args = {
      'id': newId,
      'impressionNoteRepository': widget.impressionNoteRepository,
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
      body: ImpressionNoteListView(
        notes: List.from(widget.impressionNoteRepository.getNotes()),
        onDelete: onDelete,
        onNoteTap: onNoteTap,
        onEdit: onEdit,
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