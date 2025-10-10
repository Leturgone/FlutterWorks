import 'package:flutter/material.dart';

import '../models/impression_note.dart';



class ImpressionNoteAboutScreen extends StatelessWidget {
  final ImpressionNote impressionNote;
  final VoidCallback onBack;

  const ImpressionNoteAboutScreen({super.key, required this.impressionNote, required this.onBack});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                impressionNote.seriesImage,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                'Запись ${impressionNote.id}',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 16),
              Text(
                'Дата ${impressionNote.createdAt}',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  impressionNote.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 24),
              // Кнопка выхода
              ElevatedButton(
                onPressed: onBack,
                child: Text('Назад'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}