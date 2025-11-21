import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/impression_note.dart';

part 'impression_note_form_store.g.dart';

class ImpressionNoteFormStore = _ImpressionNoteFormStore with _$ImpressionNoteFormStore;

abstract class _ImpressionNoteFormStore with Store {
  @observable
  String description = '';

  @observable
  String? seriesCover;

  @observable
  bool isLoading = false;

  @observable
  String? descriptionError;

  @observable
  String? coverError;

  @action
  void setDescription(String value) {
    description = value;
    descriptionError = null;
  }

  @action
  void setSeriesCover(String? value) {
    seriesCover = value;
    coverError = null;
  }

  @action
  void seData(ImpressionNote note){
    description = note.description;
    seriesCover = note.seriesImage;
  }

  @action
  bool validate() {
    bool isValid = true;

    if (seriesCover == null || seriesCover!.isEmpty) {
      coverError = 'Пожалуйста, выберите серию';
      isValid = false;
    }

    if (description.trim().isEmpty) {
      descriptionError = 'Пожалуйста, заполните поле "Впечатление"';
      isValid = false;
    }

    return isValid;
  }

  @action
  void updateNote(int id, ImpressionNote note, String newDescription, String newImage) {
    final oldImpressionNote = note;
    final index = GetIt.I<ObservableList<ImpressionNote>>().indexWhere((note) => note.id == id);
    if (index != -1) {
      GetIt.I<ObservableList<ImpressionNote>>()[index] = ImpressionNote(
          id: oldImpressionNote.id,
          description: newDescription,
          seriesImage: newImage,
          createdAt: DateTime.now()
      );
    }
  }

  @action
  void addNote(ImpressionNote note) {
    GetIt.I<ObservableList<ImpressionNote>>().add(note);
  }

}