
import 'package:work12/core/models/impression_note.dart';
import 'package:work12/domain/interfaces/repositories/impression_note_repository.dart';

class CreateNoteUseCase {
  final ImpressionNoteRepository impressionNoteRepository;

  CreateNoteUseCase(this.impressionNoteRepository);

  Future<bool> execute(ImpressionNote note){
    return impressionNoteRepository.createImpressionNote(note);
  }
}