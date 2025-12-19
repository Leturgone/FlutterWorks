// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impression_note_about_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImpressionNoteAboutStore on _ImpressionNoteAboutStore, Store {
  late final _$impressionNoteAtom = Atom(
    name: '_ImpressionNoteAboutStore.impressionNote',
    context: context,
  );

  @override
  ImpressionNote? get impressionNote {
    _$impressionNoteAtom.reportRead();
    return super.impressionNote;
  }

  @override
  set impressionNote(ImpressionNote? value) {
    _$impressionNoteAtom.reportWrite(value, super.impressionNote, () {
      super.impressionNote = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_ImpressionNoteAboutStore.isLoading',
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

  late final _$loadNoteByIdAsyncAction = AsyncAction(
    '_ImpressionNoteAboutStore.loadNoteById',
    context: context,
  );

  @override
  Future<void> loadNoteById(int id) {
    return _$loadNoteByIdAsyncAction.run(() => super.loadNoteById(id));
  }

  @override
  String toString() {
    return '''
impressionNote: ${impressionNote},
isLoading: ${isLoading}
    ''';
  }
}
