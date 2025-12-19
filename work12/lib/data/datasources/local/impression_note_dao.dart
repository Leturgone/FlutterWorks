import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

part 'impression_note_dao.g.dart';

class ImpressionNotes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get image => text()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [ImpressionNotes])
class ImpressionNoteDatabase extends _$ImpressionNoteDatabase {
  ImpressionNoteDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'impression_notes.db'));
      return NativeDatabase(file);
    });
  }
}