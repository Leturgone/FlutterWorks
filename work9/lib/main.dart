import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:work9/features/impression_note/state/impression_notes_store.dart';

import 'app.dart';

void main() {
  GetIt.I.registerSingleton<ImpressionNotesStore>(ImpressionNotesStore());
  runApp(MyApp());
}
