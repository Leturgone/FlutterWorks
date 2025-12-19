import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:work12/domain/usecases/impression_note/get_note_about_usecase.dart';

import '../../../../core/models/impression_note.dart';


part 'impression_note_about_store.g.dart';

class ImpressionNoteAboutStore = _ImpressionNoteAboutStore with _$ImpressionNoteAboutStore;

abstract class _ImpressionNoteAboutStore with Store {

  @observable
  ImpressionNote? impressionNote;

  @observable
  bool isLoading = false;

  final GetNoteAboutUseCase getNoteAboutUseCase = GetIt.I<GetNoteAboutUseCase>();

  @action
  Future<void> loadNoteById(int id) async {
    isLoading = true;


    final note = await getNoteAboutUseCase.execute(id);

    impressionNote = note;
    isLoading = false;
  }
}