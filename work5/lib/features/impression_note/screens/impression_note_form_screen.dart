
import 'package:flutter/material.dart';
import 'package:work5/features/impression_note/models/impression_note.dart';

class ImpressionNoteFormScreen extends StatefulWidget  {
  final ImpressionNote? impressionNote;
  final String? selectedCover;
  final Function(String,String) onSave;
  final VoidCallback onCancel;
  final VoidCallback onSelect;

  const ImpressionNoteFormScreen({super.key, this.impressionNote, required this.onSave, required this.onCancel, required this.onSelect, this.selectedCover});

  @override
  _ImpressionNoteFormScreenState createState() => _ImpressionNoteFormScreenState();
}

class _ImpressionNoteFormScreenState extends State<ImpressionNoteFormScreen> {
  late TextEditingController _noteController;
  String? _seriesCover;

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

    widget.onSave(newDescription, newImage);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Форма заметки'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: widget.onSelect ,
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
                    labelText: 'Запись',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: null,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _save,
                    child: Text('Сохранить'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: widget.onCancel,
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