import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:work11/data/datasources/api/auth_datasource.dart';
import 'package:work11/data/datasources/api/comic_series_datasource.dart';
import 'package:work11/data/datasources/api/games_datasource.dart';
import 'package:work11/data/datasources/api/movies_datastore.dart';
import 'package:work11/data/datasources/api/news_datastore.dart';
import 'package:work11/data/datasources/local/impression_note_datastore.dart';
import 'package:work11/data/datasources/local/token_datasource.dart';
import 'package:work11/data/repositories/auth_repository_impl.dart';
import 'package:work11/data/repositories/comic_series_repository_impl.dart';
import 'package:work11/data/repositories/games_repository_impl.dart';
import 'package:work11/data/repositories/impression_note_repository_impl.dart';
import 'package:work11/data/repositories/movies_repository_impl.dart';
import 'package:work11/data/repositories/news_repository_impl.dart';
import 'package:work11/domain/interfaces/repositories/auth_repository.dart';
import 'package:work11/domain/interfaces/repositories/comic_series_repository.dart';
import 'package:work11/domain/interfaces/repositories/games_repository.dart';
import 'package:work11/domain/interfaces/repositories/impression_note_repository.dart';
import 'package:work11/domain/interfaces/repositories/movies_repository.dart';
import 'package:work11/domain/interfaces/repositories/news_repository.dart';
import 'package:work11/domain/usecases/auth/get_profile_usecase.dart';
import 'package:work11/domain/usecases/auth/login_usecase.dart';
import 'package:work11/domain/usecases/auth/register_usecase.dart';
import 'package:work11/domain/usecases/comic_series/get_comic_series_about_usecase.dart';
import 'package:work11/domain/usecases/comic_series/get_comic_series_list_usecase.dart';
import 'package:work11/domain/usecases/games/get_game_about_usecase.dart';
import 'package:work11/domain/usecases/games/get_game_list_usecase.dart';
import 'package:work11/domain/usecases/impression_note/create_note_usecase.dart';
import 'package:work11/domain/usecases/impression_note/delete_note_usecase.dart';
import 'package:work11/domain/usecases/impression_note/edit_note_usecase.dart';
import 'package:work11/domain/usecases/impression_note/get_note_about_usecase.dart';
import 'package:work11/domain/usecases/impression_note/get_notes_list_usecase.dart';
import 'package:work11/domain/usecases/impression_note/sort_notes_usecase.dart';
import 'package:work11/domain/usecases/movies/get_movie_about_usecase.dart';
import 'package:work11/domain/usecases/movies/get_movies_list_usecase.dart';
import 'package:work11/domain/usecases/news/get_news_about_usecase.dart';
import 'package:work11/domain/usecases/news/get_news_usecase.dart';

import 'ui/app.dart';
import 'core/models/impression_note.dart';

void main() {

  GetIt.I.registerSingleton<AuthRepository>((AuthRepositoryImpl(AuthDataSource(),LocalAuthDataSource())));
  GetIt.I.registerSingleton<ComicSeriesRepository>(ComicSeriesRepositoryImpl(ComicSeriesDataSource()));
  GetIt.I.registerSingleton<GamesRepository>(GamesRepositoryImpl(GamesDataSource()));
  GetIt.I.registerSingleton<ImpressionNoteRepository>(ImpressionNoteRepositoryImpl(ImpressionNoteDataSource()));
  GetIt.I.registerSingleton<MoviesRepository>(MoviesRepositoryImpl(MoviesDataSource()));
  GetIt.I.registerSingleton<NewsRepository>(NewsRepositoryImpl(NewsDataSource()));

  GetIt.I.registerSingleton<GetProfileUseCase>(GetProfileUseCase(GetIt.I<AuthRepository>()));
  GetIt.I.registerSingleton<LoginUseCase>(LoginUseCase(GetIt.I<AuthRepository>()));
  GetIt.I.registerSingleton<RegisterUseCase>(RegisterUseCase(GetIt.I<AuthRepository>()));

  GetIt.I.registerSingleton<GetComicSeriesAboutUseCase>(GetComicSeriesAboutUseCase(GetIt.I<ComicSeriesRepository>()));
  GetIt.I.registerSingleton<GetComicSeriesListUseCase>(GetComicSeriesListUseCase(GetIt.I<ComicSeriesRepository>()));

  GetIt.I.registerSingleton<GetMovieAboutUseCase>(GetMovieAboutUseCase(GetIt.I<MoviesRepository>()));
  GetIt.I.registerSingleton<GetMoviesListUseCase>(GetMoviesListUseCase(GetIt.I<MoviesRepository>()));

  GetIt.I.registerSingleton<GetNewsAboutUseCase>(GetNewsAboutUseCase(GetIt.I<NewsRepository>()));
  GetIt.I.registerSingleton<GetNewsUseCase>(GetNewsUseCase(GetIt.I<NewsRepository>()));

  GetIt.I.registerSingleton<GetGameAboutUseCase>(GetGameAboutUseCase(GetIt.I<GamesRepository>()));
  GetIt.I.registerSingleton<GetGameListUseCase>(GetGameListUseCase(GetIt.I<GamesRepository>()));

  GetIt.I.registerSingleton<CreateNoteUseCase>(CreateNoteUseCase(GetIt.I<ImpressionNoteRepository>()));
  GetIt.I.registerSingleton<DeleteNoteUseCase>(DeleteNoteUseCase(GetIt.I<ImpressionNoteRepository>()));
  GetIt.I.registerSingleton<EditNoteUseCase>(EditNoteUseCase(GetIt.I<ImpressionNoteRepository>()));
  GetIt.I.registerSingleton<GetNoteAboutUseCase>(GetNoteAboutUseCase(GetIt.I<ImpressionNoteRepository>()));
  GetIt.I.registerSingleton<GetNotesListUseCase>(GetNotesListUseCase(GetIt.I<ImpressionNoteRepository>()));
  GetIt.I.registerSingleton<SortNotesUseCase>(SortNotesUseCase(GetIt.I<ImpressionNoteRepository>()));


  runApp(MyApp());
}
