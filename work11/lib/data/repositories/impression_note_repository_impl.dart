import 'dart:async';

import '../../core/models/impression_note.dart';
import '../../domain/interfaces/repositories/impression_note_repository.dart';
import '../datasources/impression_note_datastore.dart';

class ImpressionNoteRepositoryImpl implements ImpressionNoteRepository {
  final ImpressionNoteDataSource _localDataSource;

  ImpressionNoteRepositoryImpl(this._localDataSource);

  @override
  Future<List<ImpressionNote>> getImpressionNoteList() async {
    try {
      return await _localDataSource.getAllNotes();
    } catch (e) {
      throw Exception('Failed to load notes: $e');
    }
  }

  @override
  Future<ImpressionNote> getImpressionNoteById(int id) async {
    try {
      return await _localDataSource.getNoteById(id);
    } catch (e) {
      throw Exception('Failed to load note $id: $e');
    }
  }

  @override
  Future<bool> editImpressionNoteById(int id, ImpressionNote editedNote) async {
    try {
      return await _localDataSource.updateNote(id, editedNote);
    } catch (e) {
      throw Exception('Failed to update note $id: $e');
    }
  }

  @override
  Future<bool> deleteImpressionNoteById(int id) async {
    try {
      return await _localDataSource.deleteNote(id);
    } catch (e) {
      throw Exception('Failed to delete note $id: $e');
    }
  }

  @override
  Future<bool> createImpressionNote(ImpressionNote note) async {
    try {
      return await _localDataSource.createNote(note);
    } catch (e) {
      throw Exception('Failed to create note: $e');
    }
  }

  @override
  Future<List<ImpressionNote>> sort() async {
    try {
      return await _localDataSource.getSortedNotes();
    } catch (e) {
      throw Exception('Failed to sort notes: $e');
    }
  }
}