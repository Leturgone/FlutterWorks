// impression_note_local_data_source.dart
import 'package:get_it/get_it.dart';

import '../../../core/models/impression_note.dart';

class ImpressionNoteDataSource {
  final List<ImpressionNote> _notes = [
    ImpressionNote(
      id: 0,
      image: "https://i.annihil.us/u/prod/marvel/i/mg/1/d0/519bad24bebcd.jpg",
      description: "Запись",
    ),
  ];

  Future<List<ImpressionNote>> getAllNotes() async {
    await Future.delayed(Duration(milliseconds: 500)); // Имитация задержки
    return List<ImpressionNote>.from(_notes);
  }

  Future<ImpressionNote> getNoteById(int id) async {
    await Future.delayed(Duration(milliseconds: 300));
    try {
      return _notes.firstWhere((note) => note.id == id);
    } catch (e) {
      throw Exception('Note with id $id not found');
    }
  }

  Future<bool> updateNote(int id, ImpressionNote editedNote) async {
    await Future.delayed(Duration(milliseconds: 400));
    final index = _notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      _notes[index] = editedNote;
      return true;
    }
    return false;
  }

  Future<bool> deleteNote(int id) async {
    await Future.delayed(Duration(milliseconds: 300));
    final initialLength = _notes.length;
    _notes.removeWhere((note) => note.id == id);
    return _notes.length < initialLength;
  }

  Future<bool> createNote(ImpressionNote note) async {
    await Future.delayed(Duration(milliseconds: 400));
    _notes.add(note);
    return true;
  }

  Future<List<ImpressionNote>> getSortedNotes() async {
    await Future.delayed(Duration(milliseconds: 200));
    final sortedNotes = List<ImpressionNote>.from(_notes);
    sortedNotes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sortedNotes;
  }
}