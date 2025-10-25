import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work7/features/comic_series/state/comic_series_container.dart';
import 'package:work7/features/gallery/state/gallery_container.dart';

import 'features/about_me/state/about_me_container.dart';
import 'features/comic_characters/state/character_container.dart';
import 'features/impression_note/state/impression_note_container.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => ComicSeriesContainer()),
      GoRoute(path: '/im_notes', builder: (context, state) => ImpressionNoteContainer()),
      GoRoute(path: '/gallery', builder: (context, state) => ComicGalleryContainer()),
      GoRoute(path: '/characters', builder: (context, state) => CharacterContainer()),
      GoRoute(path: '/about_me', builder: (context, state) => AboutMeContainer()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
