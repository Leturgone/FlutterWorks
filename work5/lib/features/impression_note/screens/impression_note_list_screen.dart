
import 'package:flutter/material.dart';
import 'package:work5/features/impression_note/models/impression_note.dart';
import 'package:work5/features/impression_note/widgets/impression_note_list_view.dart';

class ImpressionNoteListScreen extends StatelessWidget {
  final List<ImpressionNote> impressionNotes;
  final VoidCallback onAdd;
  final void Function(int id)? onDelete;
  final ValueChanged<ImpressionNote> onNoteTap;
  final ValueChanged<ImpressionNote>  onEdit;
  final VoidCallback onSort;

  const ImpressionNoteListScreen({
    super.key, required this.impressionNotes,
    required this.onAdd, required this.onDelete,
    required this.onNoteTap, required this.onEdit, required this.onSort});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Заметки о впечатлениях'),
        ),
        body: ImpressionNoteListView(notes: impressionNotes, onDelete: onDelete!, onNoteTap: onNoteTap,onEdit: onEdit),
        floatingActionButton:Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: onAdd,
              tooltip: 'Добавить заметку',
              child: const Icon(Icons.add),
            ),
            SizedBox(width: 16),
            FloatingActionButton(
              onPressed: onSort,
              tooltip: 'Сортировать',
              child: const Icon(Icons.sort_by_alpha),
            ),
          ],
        ),
    );
  }
}