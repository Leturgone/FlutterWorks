import 'package:go_router/go_router.dart';

import 'features/comic_series/models/comic_series.dart';
import 'features/comic_series/screens/comic_series_about_screen.dart';
import 'features/comic_series/screens/comic_series_list_screen.dart';
import 'features/gallery/screens/comic_gallery_screen.dart';
import 'features/impression_note/impression_rep_provider.dart';
import 'features/impression_note/models/impression_note.dart';
import 'features/impression_note/repository/impression_notes_repository.dart';
import 'features/impression_note/screens/impression_note_about_screen.dart';
import 'features/impression_note/screens/impression_note_form_screen.dart';
import 'features/impression_note/screens/impression_note_list_screen.dart';
import 'features/shared_data.dart';
import 'home_page.dart';

List<String> imageUrls = [
  "https://i.annihil.us/u/prod/marvel/i/mg/1/d0/519bad24bebcd.jpg",
  "https://cdn.marvel.com/u/prod/marvel/i/mg/4/90/659c61377f79c/standard_incredible.jpg",
  "https://cdn.marvel.com/u/prod/marvel/i/mg/6/f0/68c053ab8d985/standard_incredible.jpg",
  "https://cdn.marvel.com/u/prod/marvel/i/mg/4/60/68e6a1293e977/standard_incredible.jpg",
  "https://cdn.marvel.com/u/prod/marvel/i/mg/4/80/575ef36168a99/standard_incredible.jpg"
];
final GoRouter appRouter = GoRouter(
    initialLocation: '/', 
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomePage()),
      GoRoute(path: '/comic_series', builder: (context, state) => ComicSeriesListScreen(seriesList: SharedData.seriesList, usual: true)),
      GoRoute(path: '/im_notes', builder: (context, state) => ImpressionNoteListScreen()),
      GoRoute(path: '/gallery', builder: (context, state) => ComicGalleryScreen(imageUrls: imageUrls)),
      GoRoute(path: '/series-about', builder: (context, state) {
          final ComicSeries series = state.extra as ComicSeries;
          return ComicSeriesAboutScreen(series: series);
        },
      ),
      GoRoute(path: '/comic_series_choose', builder: (context, state) {
          final Function(String) onSelectImage = state.extra as Function(String);
          return ComicSeriesListScreen(seriesList: SharedData.seriesList, usual: false, onSelectImage: onSelectImage,);
        },
      ),
      GoRoute(path: '/note/about', builder: (context, state) {
          final note = state.extra as ImpressionNote;
          return ImpressionNoteAboutScreen(impressionNote: note);
        },
      ),
      GoRoute(path: '/note/edit', builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return ImpressionNoteFormScreen(id: args['id'], impressionNote: args['impressionNote']);
        },
      ),
      GoRoute(path: '/note/add', builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return ImpressionNoteFormScreen(id: args['id']);
        },
      ),
      GoRoute(path: '/note/add/image', builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return ImpressionNoteFormScreen(id: args['id'], impressionNote: args['impressionNote'], selectedCover: args['selectedCover'],);
        },
      ),
    ],
);

