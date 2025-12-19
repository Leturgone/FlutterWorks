import 'package:flutter/material.dart';
import 'package:work11/core/models/impression_note.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
          leading: CachedNetworkImage(
            imageUrl: note.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
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