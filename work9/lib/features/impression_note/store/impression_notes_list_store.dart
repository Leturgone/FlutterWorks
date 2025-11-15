import 'package:get_it/get_it.dart';

import '../models/impression_note.dart';
import 'package:mobx/mobx.dart';
part 'impression_notes_list_store.g.dart';


class ImpressionNotesListStore = _ImpressionNotesListStore with _$ImpressionNotesListStore;

abstract class _ImpressionNotesListStore with Store {
  @observable
  ObservableList<ImpressionNote>? impressionNotes;

  @observable
  bool isLoading = false;


  @action
  Future<void> loadNoteList() async {
    isLoading = true;

    await Future.delayed(Duration(seconds: 1)); // Эмуляция загрузки из БД

    impressionNotes = GetIt.I<ObservableList<ImpressionNote>>();
    isLoading = false;
  }

  @action
  void removeNote(int id) {
    impressionNotes?.removeWhere((note) => note.id == id);
    GetIt.I<ObservableList<ImpressionNote>>().removeWhere((note) => note.id == id);
  }

  @action
  void sort() {
    impressionNotes?.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

}