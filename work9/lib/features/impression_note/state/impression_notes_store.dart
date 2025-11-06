
import '../models/impression_note.dart';
import 'package:mobx/mobx.dart';
part 'impression_notes_store.g.dart';

class ImpressionNotesStore = _ImpressionNotesStore with _$ImpressionNotesStore;

abstract class _ImpressionNotesStore with Store {
  @observable
  List<ImpressionNote> impressionNotes = List.of([
    ImpressionNote(
      id: 0,
      seriesImage: "https://i.annihil.us/u/prod/marvel/i/mg/1/d0/519bad24bebcd.jpg",
      description: "Запись",
    ),
  ]);

  @action
  void addNote(ImpressionNote note) {
    impressionNotes.add(note);
  }

  @action
  void updateNote(int id, ImpressionNote note, String newDescription, String newImage) {
    final oldImpressionNote = note;
    final index = id;
    if (index != -1) {
      impressionNotes[id] = ImpressionNote(
          id: oldImpressionNote.id,
          description: newDescription,
          seriesImage: newImage,
          createdAt: DateTime.now()
      );
    }
  }

  @action
  void removeNote(int id) {
    impressionNotes.removeWhere((note) => note.id == id);
  }
}