import 'package:work11/domain/interfaces/repositories/impression_note_repository.dart';

class DeleteNoteUseCase {
  final ImpressionNoteRepository impressionNoteRepository;

  DeleteNoteUseCase(this.impressionNoteRepository);

  Future<bool> execute(int id){
    return impressionNoteRepository.deleteImpressionNoteById(id);
  }
}