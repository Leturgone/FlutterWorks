
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work8/features/impression_note/models/impression_note.dart';
import 'package:work8/features/impression_note/repository/impression_notes_repository.dart';

class ImpressionNoteFormScreen extends StatefulWidget  {
  final int id;
  final ImpressionNoteRepository impressionNoteRepository;
  final ImpressionNote? impressionNote;
  final String? selectedCover;
  const ImpressionNoteFormScreen({super.key, this.impressionNote, this.selectedCover, required this.id, required this.impressionNoteRepository});

  @override
  _ImpressionNoteFormScreenState createState() => _ImpressionNoteFormScreenState();
}

class _ImpressionNoteFormScreenState extends State<ImpressionNoteFormScreen> {
  late TextEditingController _noteController;
  String? _seriesCover;

  void onImageTap() {
    if (_seriesCover == null || _seriesCover!.isEmpty) {
      context.push('/comic_series_choose',extra: (String selectedImage) {
        final args = {
          'id': widget.id,
          'impressionNoteRepository': widget.impressionNoteRepository,
          'selectedCover': selectedImage,
        };
        context.pushReplacement('/note/add/image', extra: args);
      });
    }
  }



  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();

    if (widget.impressionNote != null) {
      _noteController.text = widget.impressionNote!.description;
      _seriesCover = widget.impressionNote!.seriesImage;
    }
    else if(widget.selectedCover!=null){
      _seriesCover = widget.selectedCover!;
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _save() {
    final newDescription = _noteController.text.trim();
    final newImage = _seriesCover ?? '';
    if (newImage.isEmpty){
      // Валидация: серия должна быть выбрана
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Пожалуйста, выберите серию.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (newDescription.isEmpty) {
      // Валидация: поле не должно быть пустым
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Пожалуйста, заполните поле "Впечатление".'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (widget.impressionNote!=null) {
      widget.impressionNoteRepository.updateNote(widget.id, widget.impressionNote!, newDescription, newImage);
    }else{
      final newImpressionNote = ImpressionNote(
          id: widget.id,
          seriesImage: newImage,
          description: newDescription,
          createdAt: DateTime.now()
      );
      widget.impressionNoteRepository.addNote(newImpressionNote);
    }
    context.pushReplacement('/im_notes');

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text('Форма заметки о впечатлении'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap:  () => onImageTap(),
                child:_seriesCover != null
                    ? Image.network(_seriesCover!, width: 150, height: 150, fit: BoxFit.cover)
                    : Container(
                    width: 150,
                    height: 150,
                    color: Colors.grey[300],
                    child: Icon(Icons.add_a_photo, size: 50))
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _noteController,
                  decoration: InputDecoration(
                    labelText: 'Впечатление',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: null,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _save(),
                    child: Text('Сохранить'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => context.pop(),
                    child: Text('Отмена'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}