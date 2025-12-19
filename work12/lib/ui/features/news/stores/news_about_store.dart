
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:work12/domain/usecases/news/get_news_about_usecase.dart';

import '../../../../core/models/news.dart';
part 'news_about_store.g.dart';

class NewsAboutStore = _NewsAboutStore with _$NewsAboutStore;


abstract class _NewsAboutStore with Store {
  @observable
  News? news;

  @observable
  bool isLoading = false;

  final GetNewsAboutUseCase getNewsAboutUseCase= GetIt.I<GetNewsAboutUseCase>();

  @action
  Future loadNews(int newsId) async {
    isLoading = true;
    news = await getNewsAboutUseCase.execute(newsId);
    isLoading = false;
  }
}