// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impression_notes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImpressionNotesStore on _ImpressionNotesStore, Store {
  late final _$impressionNotesAtom = Atom(
    name: '_ImpressionNotesStore.impressionNotes',
    context: context,
  );

  @override
  List<ImpressionNote> get impressionNotes {
    _$impressionNotesAtom.reportRead();
    return super.impressionNotes;
  }

  @override
  set impressionNotes(List<ImpressionNote> value) {
    _$impressionNotesAtom.reportWrite(value, super.impressionNotes, () {
      super.impressionNotes = value;
    });
  }

  late final _$_ImpressionNotesStoreActionController = ActionController(
    name: '_ImpressionNotesStore',
    context: context,
  );

  @override
  void addNote(ImpressionNote note) {
    final _$actionInfo = _$_ImpressionNotesStoreActionController.startAction(
      name: '_ImpressionNotesStore.addNote',
    );
    try {
      return super.addNote(note);
    } finally {
      _$_ImpressionNotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNote(
    int id,
    ImpressionNote note,
    String newDescription,
    String newImage,
  ) {
    final _$actionInfo = _$_ImpressionNotesStoreActionController.startAction(
      name: '_ImpressionNotesStore.updateNote',
    );
    try {
      return super.updateNote(id, note, newDescription, newImage);
    } finally {
      _$_ImpressionNotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeNote(int id) {
    final _$actionInfo = _$_ImpressionNotesStoreActionController.startAction(
      name: '_ImpressionNotesStore.removeNote',
    );
    try {
      return super.removeNote(id);
    } finally {
      _$_ImpressionNotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
impressionNotes: ${impressionNotes}
    ''';
  }
}
