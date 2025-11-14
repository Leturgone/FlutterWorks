import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/impression_note.dart';

part 'impression_note_about_store.g.dart';

class ImpressionNoteAboutStore = _ImpressionNoteAboutStore with _$ImpressionNoteAboutStore;

abstract class _ImpressionNoteAboutStore with Store {

  @observable
  ImpressionNote? impressionNote;

  @observable
  bool isLoading = false;


  @action
  Future<void> loadNoteById(int id) async {
    isLoading = true;

    await Future.delayed(Duration(seconds: 1)); // Эмуляция загрузки из БД

    final note = GetIt.I<ObservableList<ImpressionNote>>()[id];

    impressionNote = note;
    isLoading = false;
  }
}