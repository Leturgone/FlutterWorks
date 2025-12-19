import 'package:drift/drift.dart';

import '../../../core/models/impression_note.dart';
import 'impression_note_dao.dart';

class ImpressionNoteDataSource {
  late ImpressionNoteDatabase _database;

  ImpressionNoteDataSource() {
    _database = ImpressionNoteDatabase();
  }

  Future<List<ImpressionNote>> getAllNotes() async {
    final query = _database.select(_database.impressionNotesTable);
    final notes = await query.get();

    return notes.map((row) => ImpressionNote(
      id: row.id,
      image: row.image,
      description: row.description,
      createdAt: row.createdAt,
    )).toList();
  }

  Future<ImpressionNote> getNoteById(int id) async {
    final query = _database.select(_database.impressionNotesTable)
      ..where((tbl) => tbl.id.equals(id));

    final note = await query.getSingleOrNull();

    if (note == null) {
      throw Exception('Note with id $id not found');
    }

    return ImpressionNote(
      id: note.id,
      image: note.image,
      description: note.description,
      createdAt: note.createdAt,
    );
  }

  Future<bool> updateNote(int id, ImpressionNote editedNote) async {
    final rowsUpdated = await (_database.update(_database.impressionNotesTable)
      ..where((tbl) => tbl.id.equals(id))
    ).write(ImpressionNotesTableCompanion(
      image: Value(editedNote.image),
      description: Value(editedNote.description),
      createdAt: Value(editedNote.createdAt),
    ));

    return rowsUpdated > 0;
  }

  Future<bool> deleteNote(int id) async {
    final rowsDeleted = await (_database.delete(_database.impressionNotesTable)
      ..where((tbl) => tbl.id.equals(id))
    ).go();

    return rowsDeleted > 0;
  }

  Future<bool> createNote(ImpressionNote note) async {
    final id = await _database.into(_database.impressionNotesTable).insert(
      ImpressionNotesTableCompanion.insert(
        image: note.image,
        description: note.description,
        createdAt: Value(note.createdAt),
      ),
    );

    return id > 0;
  }

  Future<List<ImpressionNote>> getSortedNotes() async {
    final query = _database.select(_database.impressionNotesTable)
      ..orderBy([
            (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
      ]);

    final notes = await query.get();

    return notes.map((row) => ImpressionNote(
      id: row.id,
      image: row.image,
      description: row.description,
      createdAt: row.createdAt,
    )).toList();
  }

  Future<void> close() async {
    await _database.close();
  }
}