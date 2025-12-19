import 'package:get_it/get_it.dart';

import 'package:mobx/mobx.dart';
import 'package:work11/domain/usecases/impression_note/delete_note_usecase.dart';
import 'package:work11/domain/usecases/impression_note/get_notes_list_usecase.dart';
import 'package:work11/domain/usecases/impression_note/sort_notes_usecase.dart';

import '../../../../core/models/impression_note.dart';
part 'impression_notes_list_store.g.dart';


class ImpressionNotesListStore = _ImpressionNotesListStore with _$ImpressionNotesListStore;

abstract class _ImpressionNotesListStore with Store {
  @observable
  ObservableList<ImpressionNote>? impressionNotes;

  @observable
  bool isLoading = false;

  final GetNotesListUseCase getNotesListUseCase = GetIt.I<GetNotesListUseCase>();
  final DeleteNoteUseCase deleteNoteUseCase = GetIt.I<DeleteNoteUseCase>();
  final SortNotesUseCase sortNotesUseCase = GetIt.I<SortNotesUseCase>();


  @action
  Future<void> loadNoteList() async {
    isLoading = true;
    final list = await getNotesListUseCase.execute();
    impressionNotes = ObservableList.of(list);
    isLoading = false;
  }

  @action
  void removeNote(int id) {
    deleteNoteUseCase.execute(id);
    loadNoteList();
  }

  @action
  Future<void> sort() async {
    isLoading = true;
    final list = await sortNotesUseCase.execute();
    impressionNotes = ObservableList.of(list);
    isLoading = false;
  }

}