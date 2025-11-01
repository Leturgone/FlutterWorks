import 'package:flutter/material.dart';
import 'package:work8/features/impression_note/impression_rep_provider.dart';
import 'package:work8/features/impression_note/repository/impression_notes_repository.dart';
import 'package:work8/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final impressionNoteRepository = ImpressionNoteRepository();
    return ImpressionRepProvider(
        impressionNoteRepository: impressionNoteRepository,
        child: MaterialApp.router(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            routerConfig: appRouter
        ));
  }
}