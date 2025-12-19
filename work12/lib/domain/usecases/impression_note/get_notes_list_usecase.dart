import 'package:work12/core/models/impression_note.dart';
import 'package:work12/domain/interfaces/repositories/impression_note_repository.dart';

class GetNotesListUseCase {
  final ImpressionNoteRepository impressionNoteRepository;

  GetNotesListUseCase(this.impressionNoteRepository);

  Future<List<ImpressionNote>> execute(){
    return impressionNoteRepository.getImpressionNoteList();
  }
}