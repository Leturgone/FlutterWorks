
import '../models/impression_note.dart';

class ImpressionNoteRepository {
  final List<ImpressionNote> _notes = [
    ImpressionNote(id: 0,
        seriesImage: "https://i.annihil.us/u/prod/marvel/i/mg/1/d0/519bad24bebcd.jpg",
        description: "Запись")
  ];

  List<ImpressionNote> getNotes() => List.unmodifiable(_notes);

  void addNote(ImpressionNote note) {
    _notes.add(note);
  }

  void updateNote(int id, ImpressionNote note, String newDescription, String newImage) {
    final oldImpressionNote = note;
    final index = id;
    if (index != -1) {
      _notes[id] = ImpressionNote(
          id: oldImpressionNote.id,
          description: newDescription,
          seriesImage: newImage,
          createdAt: DateTime.now()
      );
    }
  }

  void removeNote(int id){
    _notes.removeWhere((n) => n.id == id);
  }
}