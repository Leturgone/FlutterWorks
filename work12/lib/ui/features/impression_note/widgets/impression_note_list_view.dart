import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:work12/core/models/impression_note.dart';
import '../widgets/impression_note_tile.dart';

class ImpressionNoteListView extends StatelessWidget {
  final List<ImpressionNote> notes;
  final ValueChanged<int> onDelete;
  final ValueChanged<ImpressionNote> onEdit;
  final ValueChanged<ImpressionNote> onNoteTap;

  const ImpressionNoteListView({
    super.key,
    required this.notes,
    required this.onEdit,
    required this.onDelete,
    required this.onNoteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      if (notes.isEmpty) {
        return const Center(
          child: Text(
            'Список заметок о впечатлениях пуст',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        );
      }

      return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return ImpressionNoteTile(key: ValueKey(note.id), note: note, onDelete: onDelete, onTap: onNoteTap,onEdit: onEdit);
        },
      );
    });
  }
}