import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'app.dart';
import 'features/impression_note/models/impression_note.dart';

void main() {
  ObservableList<ImpressionNote> impressionNotes = ObservableList.of([
    ImpressionNote(
      id: 0,
      seriesImage: "https://i.annihil.us/u/prod/marvel/i/mg/1/d0/519bad24bebcd.jpg",
      description: "Запись",
    ),
  ]);

  GetIt.I.registerSingleton<ObservableList<ImpressionNote>>(impressionNotes);

  runApp(MyApp());
}
