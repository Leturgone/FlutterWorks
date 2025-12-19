
import 'package:work11/core/models/impression_note.dart';

abstract class ImpressionNoteRepository {
  Future<List<ImpressionNote>> getImpressionNoteList();
  Future<ImpressionNote> getImpressionNoteById(int id);
  Future<bool> editImpressionNoteById(int id, ImpressionNote editedNote);
  Future<bool> deleteImpressionNoteById(int id);
  Future<bool> createImpressionNote(ImpressionNote note);
  Future<List<ImpressionNote>> sort();
}