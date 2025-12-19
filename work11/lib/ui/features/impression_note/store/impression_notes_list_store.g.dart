// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impression_notes_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImpressionNotesListStore on _ImpressionNotesListStore, Store {
  late final _$impressionNotesAtom = Atom(
    name: '_ImpressionNotesListStore.impressionNotes',
    context: context,
  );

  @override
  ObservableList<ImpressionNote>? get impressionNotes {
    _$impressionNotesAtom.reportRead();
    return super.impressionNotes;
  }

  @override
  set impressionNotes(ObservableList<ImpressionNote>? value) {
    _$impressionNotesAtom.reportWrite(value, super.impressionNotes, () {
      super.impressionNotes = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_ImpressionNotesListStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadNoteListAsyncAction = AsyncAction(
    '_ImpressionNotesListStore.loadNoteList',
    context: context,
  );

  @override
  Future<void> loadNoteList() {
    return _$loadNoteListAsyncAction.run(() => super.loadNoteList());
  }

  late final _$sortAsyncAction = AsyncAction(
    '_ImpressionNotesListStore.sort',
    context: context,
  );

  @override
  Future<void> sort() {
    return _$sortAsyncAction.run(() => super.sort());
  }

  late final _$_ImpressionNotesListStoreActionController = ActionController(
    name: '_ImpressionNotesListStore',
    context: context,
  );

  @override
  void removeNote(int id) {
    final _$actionInfo = _$_ImpressionNotesListStoreActionController
        .startAction(name: '_ImpressionNotesListStore.removeNote');
    try {
      return super.removeNote(id);
    } finally {
      _$_ImpressionNotesListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
impressionNotes: ${impressionNotes},
isLoading: ${isLoading}
    ''';
  }
}
