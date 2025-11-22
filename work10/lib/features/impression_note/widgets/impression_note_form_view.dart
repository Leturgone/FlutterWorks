import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../models/impression_note.dart';

class ImpressionNoteForm extends StatelessWidget {
  final String description;
  final String? seriesCover;
  final String? coverError;
  final String? descriptionError;
  final VoidCallback onImageTapComic;
  final VoidCallback onImageTapMovie;
  final VoidCallback onImageTapGame;
  final ValueChanged<String> onDescriptionChanged;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const ImpressionNoteForm({
    super.key,
    required this.description,
    required this.seriesCover,
    required this.coverError,
    required this.descriptionError,
    required this.onDescriptionChanged,
    required this.onSave,
    required this.onCancel,
    required this.onImageTapComic,
    required this.onImageTapMovie,
    required this.onImageTapGame,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildImageSection(),
        _buildDescriptionSection(),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildImageSection() {
    return Column(
      children: [
        // Изображение без обработки нажатия
        seriesCover != null
            ? Image.network(seriesCover!, width: 150, height: 150, fit: BoxFit.cover,
        ): Container(
          width: 150,
          height: 150,
          color: Colors.grey[300],
          child: const Icon(Icons.add_a_photo, size: 50),
        ),

        // Три кнопки под изображением
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildImageButton('Серия комиксов', Icons.book,onImageTapComic),
            const SizedBox(width: 8),
            _buildImageButton('Игра', Icons.videogame_asset,onImageTapGame),
            const SizedBox(width: 8),
            _buildImageButton('Фильм', Icons.movie,onImageTapMovie),
          ],
        ),

        _buildCoverError(),
      ],
    );
  }

  Widget _buildImageButton(String text, IconData icon, VoidCallback onImageTap) {
    return ElevatedButton.icon(
      onPressed: onImageTap,
      icon: Icon(icon, size: 16),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  Widget _buildCoverError() {
    return coverError != null
        ? Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        coverError!,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 12,
        ),
      ),
    )
        : const SizedBox();
  }

  Widget _buildDescriptionSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: TextEditingController(text: description)
          ..selection = TextSelection.collapsed(
            offset: description.length,
          ),
        onChanged: onDescriptionChanged,
        decoration: InputDecoration(
          labelText: 'Впечатление',
          border: const OutlineInputBorder(),
          errorText: descriptionError,
        ),
        maxLines: null,
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onSave,
          child: const Text('Сохранить'),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: onCancel,
          child: const Text('Отмена'),
        ),
      ],
    );
  }
}