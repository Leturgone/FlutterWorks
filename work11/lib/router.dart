import 'package:go_router/go_router.dart';
import 'package:work11/features/auth/screens/login_screen.dart';
import 'package:work11/features/auth/screens/register_screen.dart';
import 'package:work11/features/games/screens/game_about_screen.dart';
import 'package:work11/features/games/screens/games_list_screen.dart';
import 'package:work11/features/movies/screens/movie_about_screen.dart';
import 'package:work11/features/movies/screens/movie_list_screen.dart';
import 'package:work11/features/news/screens/news_about_screen.dart';
import 'package:work11/features/news/screens/news_list_screen.dart';
import 'package:work11/features/profile/screens/profile_screen.dart';
import 'features/comic_series/screens/comic_series_about_screen.dart';
import 'features/comic_series/screens/comic_series_list_screen.dart';
import 'features/impression_note/screens/impression_note_about_screen.dart';
import 'features/impression_note/screens/impression_note_form_screen.dart';
import 'features/impression_note/screens/impression_note_list_screen.dart';

final GoRouter appRouter = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/comic_series', builder: (context, state) => ComicSeriesListScreen( usual: true)),
      GoRoute(path: '/im_notes', builder: (context, state) => ImpressionNoteListScreen()),
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
      GoRoute(path: '/movie_choose', builder: (context, state) {
          final Function(String) onSelectImage = state.extra as Function(String);
          return MovieListScreen(usual: false, onSelectImage: onSelectImage,);
        },
      ),
      GoRoute(path: '/game_choose', builder: (context, state) {
          final Function(String) onSelectImage = state.extra as Function(String);
          return GameListScreen(usual: false, onSelectImage: onSelectImage,);
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
      GoRoute(path: '/movies', builder: (context, state) => MovieListScreen( usual: true)),
      GoRoute(path: '/movie-about', builder: (context, state) {
          final int movieId = state.extra as int;
          return MovieAboutScreen(movieId: movieId);
        },
      ),
      GoRoute(path: '/games', builder: (context, state) => GameListScreen( usual: true)),
      GoRoute(path: '/game-about', builder: (context, state) {
        final int gameId = state.extra as int;
        return GameAboutScreen(gameId: gameId);
      },
      ),
      GoRoute(path: '/news', builder: (context, state) => NewsListScreen( usual: true)),
      GoRoute(path: '/news-about', builder: (context, state) {
        final int newsId = state.extra as int;
        return NewsAboutScreen(newsId: newsId);
      },
      ),
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
      GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
      GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
    ],
);

