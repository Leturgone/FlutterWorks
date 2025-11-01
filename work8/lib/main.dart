import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:work8/features/impression_note/repository/impression_notes_repository.dart';

import 'app.dart';

void main() {
  GetIt.I.registerSingleton<ImpressionNoteRepository>(ImpressionNoteRepository());
  runApp(MyApp());
}
