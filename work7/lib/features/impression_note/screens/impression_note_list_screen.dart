
import 'package:flutter/material.dart';
import 'package:work7/features/comic_series/screens/comic_series_list_screen.dart';
import 'package:work7/features/impression_note/models/impression_note.dart';
import 'package:work7/features/impression_note/screens/impression_note_about_screen.dart';
import 'package:work7/features/impression_note/screens/impression_note_form_screen.dart';
import 'package:work7/features/impression_note/widgets/impression_note_list_view.dart';

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
    Navigator.push(context, MaterialPageRoute(builder: (_) => ImpressionNoteAboutScreen(impressionNote: note)));
  }


  // Обработка редактирования заметки
  void onEdit(ImpressionNote note) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ImpressionNoteFormScreen(
        id: note.id,
        impressionNote: note,
        impressionNoteRepository: widget.impressionNoteRepository)));
  }

  // Добавление новой заметки
  void onAdd() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ImpressionNoteFormScreen(
      id: notes.lastOrNull != null ? notes.lastOrNull!.id+1 : 1,
      impressionNoteRepository: widget.impressionNoteRepository,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {Navigator.of(context).pop();},
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