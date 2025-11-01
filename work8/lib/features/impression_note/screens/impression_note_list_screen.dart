
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:work8/features/impression_note/impression_rep_provider.dart';
import 'package:work8/features/impression_note/models/impression_note.dart';
import 'package:work8/features/impression_note/widgets/impression_note_list_view.dart';

import '../repository/impression_notes_repository.dart';

class ImpressionNoteListScreen extends StatefulWidget {

  const ImpressionNoteListScreen({super.key});

  @override
  _ImpressionNoteListScreenState createState() => _ImpressionNoteListScreenState();
}

class _ImpressionNoteListScreenState extends State<ImpressionNoteListScreen> {
  late List<ImpressionNote> notes;
  late ImpressionNoteRepository impressionNoteRepository;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    impressionNoteRepository = ImpressionRepProvider.of(context).impressionNoteRepository;
    notes = List.from(impressionNoteRepository.getNotes());
  }

  // Функция удаления
  void onDelete(int id){
    setState(() {
      impressionNoteRepository.removeNote(id);
      notes = List.from(impressionNoteRepository.getNotes());
    });
  }

  // Функция сортировки
  void onSort() {
    setState(() {
      notes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
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
      'impressionNoteRepository': impressionNoteRepository,
    };
    context.push('/note/edit', extra: args);
  }

  // Добавление новой заметки
  void onAdd() {
    final newId = notes.lastOrNull != null ? notes.lastOrNull!.id + 1 : 1;
    final args = {
      'id': newId,
      'impressionNoteRepository': impressionNoteRepository,
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
        notes: notes,
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