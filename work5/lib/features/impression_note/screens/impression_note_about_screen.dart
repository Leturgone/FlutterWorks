import 'package:flutter/material.dart';
import 'package:work5/features/impression_note/widgets/impression_note_about_view.dart';

import '../models/impression_note.dart';



class ImpressionNoteAboutScreen extends StatelessWidget {
  final ImpressionNote impressionNote;
  final VoidCallback onBack;

  const ImpressionNoteAboutScreen({super.key, required this.impressionNote, required this.onBack});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImpressionNoteAboutView(impressionNote: impressionNote, onBack: onBack),
    );
  }
}