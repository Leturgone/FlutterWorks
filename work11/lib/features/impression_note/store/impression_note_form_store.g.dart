// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impression_note_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImpressionNoteFormStore on _ImpressionNoteFormStore, Store {
  late final _$descriptionAtom = Atom(
    name: '_ImpressionNoteFormStore.description',
    context: context,
  );

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$seriesCoverAtom = Atom(
    name: '_ImpressionNoteFormStore.seriesCover',
    context: context,
  );

  @override
  String? get seriesCover {
    _$seriesCoverAtom.reportRead();
    return super.seriesCover;
  }

  @override
  set seriesCover(String? value) {
    _$seriesCoverAtom.reportWrite(value, super.seriesCover, () {
      super.seriesCover = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_ImpressionNoteFormStore.isLoading',
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

  late final _$descriptionErrorAtom = Atom(
    name: '_ImpressionNoteFormStore.descriptionError',
    context: context,
  );

  @override
  String? get descriptionError {
    _$descriptionErrorAtom.reportRead();
    return super.descriptionError;
  }

  @override
  set descriptionError(String? value) {
    _$descriptionErrorAtom.reportWrite(value, super.descriptionError, () {
      super.descriptionError = value;
    });
  }

  late final _$coverErrorAtom = Atom(
    name: '_ImpressionNoteFormStore.coverError',
    context: context,
  );

  @override
  String? get coverError {
    _$coverErrorAtom.reportRead();
    return super.coverError;
  }

  @override
  set coverError(String? value) {
    _$coverErrorAtom.reportWrite(value, super.coverError, () {
      super.coverError = value;
    });
  }

  late final _$_ImpressionNoteFormStoreActionController = ActionController(
    name: '_ImpressionNoteFormStore',
    context: context,
  );

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_ImpressionNoteFormStoreActionController.startAction(
      name: '_ImpressionNoteFormStore.setDescription',
    );
    try {
      return super.setDescription(value);
    } finally {
      _$_ImpressionNoteFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeriesCover(String? value) {
    final _$actionInfo = _$_ImpressionNoteFormStoreActionController.startAction(
      name: '_ImpressionNoteFormStore.setSeriesCover',
    );
    try {
      return super.setSeriesCover(value);
    } finally {
      _$_ImpressionNoteFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void seData(ImpressionNote note) {
    final _$actionInfo = _$_ImpressionNoteFormStoreActionController.startAction(
      name: '_ImpressionNoteFormStore.seData',
    );
    try {
      return super.seData(note);
    } finally {
      _$_ImpressionNoteFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validate() {
    final _$actionInfo = _$_ImpressionNoteFormStoreActionController.startAction(
      name: '_ImpressionNoteFormStore.validate',
    );
    try {
      return super.validate();
    } finally {
      _$_ImpressionNoteFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNote(
    int id,
    ImpressionNote note,
    String newDescription,
    String newImage,
  ) {
    final _$actionInfo = _$_ImpressionNoteFormStoreActionController.startAction(
      name: '_ImpressionNoteFormStore.updateNote',
    );
    try {
      return super.updateNote(id, note, newDescription, newImage);
    } finally {
      _$_ImpressionNoteFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNote(ImpressionNote note) {
    final _$actionInfo = _$_ImpressionNoteFormStoreActionController.startAction(
      name: '_ImpressionNoteFormStore.addNote',
    );
    try {
      return super.addNote(note);
    } finally {
      _$_ImpressionNoteFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
description: ${description},
seriesCover: ${seriesCover},
isLoading: ${isLoading},
descriptionError: ${descriptionError},
coverError: ${coverError}
    ''';
  }
}
