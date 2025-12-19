import 'package:work11/core/models/impression_note.dart';
import 'package:work11/domain/interfaces/repositories/impression_note_repository.dart';

class GetNoteAboutUseCase {
  final ImpressionNoteRepository impressionNoteRepository;

  GetNoteAboutUseCase(this.impressionNoteRepository);

  Future<ImpressionNote> execute(int id){
    return impressionNoteRepository.getImpressionNoteById(id);
  }
}