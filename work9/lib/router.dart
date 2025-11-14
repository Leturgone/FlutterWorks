import 'package:go_router/go_router.dart';

import 'features/comic_series/models/comic_series.dart';
import 'features/comic_series/screens/comic_series_about_screen.dart';
import 'features/comic_series/screens/comic_series_list_screen.dart';
import 'features/gallery/screens/comic_gallery_screen.dart';
import 'features/impression_note/models/impression_note.dart';
import 'features/impression_note/screens/impression_note_about_screen.dart';
import 'features/impression_note/screens/impression_note_form_screen.dart';
import 'features/impression_note/screens/impression_note_list_screen.dart';
import 'home_page.dart';

final GoRouter appRouter = GoRouter(
    initialLocation: '/', 
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomePage()),
      GoRoute(path: '/comic_series', builder: (context, state) => ComicSeriesListScreen( usual: true)),
      GoRoute(path: '/im_notes', builder: (context, state) => ImpressionNoteListScreen()),
      GoRoute(path: '/gallery', builder: (context, state) => ComicGalleryScreen()),
      GoRoute(path: '/series-about', builder: (context, state) {
          final int seriesId = state.extra as int;
          return ComicSeriesAboutScreen(seriesId: seriesId);
        },
      ),
      GoRoute(path: '/comic_series_choose', builder: (context, state) {
          final Function(String) onSelectImage = state.extra as Function(String);
          return ComicSeriesListScreen(usual: false, onSelectImage: onSelectImage,);
        },
      ),
      GoRoute(path: '/note/about', builder: (context, state) {
          final noteId = state.extra as int;
          return ImpressionNoteAboutScreen(noteId: noteId,);
        },
      ),
      GoRoute(path: '/note/edit', builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return ImpressionNoteFormScreen(id: args['id'], impressionNote: args['impressionNote']);
        },
      ),
      GoRoute(path: '/note/add', builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return ImpressionNoteFormScreen(id: args['id'],);
        },
      ),
      GoRoute(path: '/note/add/image', builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return ImpressionNoteFormScreen(id: args['id'], impressionNote: args['impressionNote'], selectedCover: args['selectedCover'],);
        },
      ),
    ],
);

