
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:work12/domain/usecases/news/get_news_usecase.dart';

import '../../../../core/models/news.dart';
part 'news_list_store.g.dart';

class NewsListStore = _NewsListStore with _$NewsListStore;

abstract class _NewsListStore with Store {
  @observable
  ObservableList<News> newsList = ObservableList<News>();

  @observable
  bool isLoading = false;

  final GetNewsUseCase getNewsUseCase= GetIt.I<GetNewsUseCase>();

  @action
  Future<void> loadNews() async {
    isLoading = true;
    final fetchedNews = await getNewsUseCase.execute();
    newsList = ObservableList.of(fetchedNews);
    isLoading = false;
  }
}