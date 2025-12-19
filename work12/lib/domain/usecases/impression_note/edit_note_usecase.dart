import 'package:work12/core/models/impression_note.dart';
import 'package:work12/domain/interfaces/repositories/impression_note_repository.dart';

class EditNoteUseCase {
  final ImpressionNoteRepository impressionNoteRepository;

  EditNoteUseCase(this.impressionNoteRepository);

  Future<bool> execute(int id,ImpressionNote newNote){
    return impressionNoteRepository.editImpressionNoteById(id,newNote);
  }
}