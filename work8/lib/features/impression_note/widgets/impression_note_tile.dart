import 'package:flutter/material.dart';
import 'package:work8/features/impression_note/models/impression_note.dart';


class ImpressionNoteTile extends StatelessWidget {
  final ImpressionNote note;
  final ValueChanged<ImpressionNote> onTap;
  final ValueChanged<int> onDelete;
  final ValueChanged<ImpressionNote> onEdit;

  const ImpressionNoteTile({
    super.key,
    required this.note,
    required this.onDelete,
    required this.onTap,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: "Заметка о впечталении ${note.id}",
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: ListTile(
          onTap: () => onTap(note),
          leading: Image.network(
            note.seriesImage,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(
            "Заметка о впечталении ${note.id}",
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                tooltip: 'Изменить заметку',
                onPressed: () => onEdit(note),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                tooltip: 'Удалить заметку',
                onPressed: () => onDelete(note.id),
              ),
            ],
          )
        ),
      ),
    );
  }
}