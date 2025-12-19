import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/news.dart';
import '../stores/news_list_store.dart';
import '../widgets/news_list_view.dart';


class NewsListScreen extends StatelessWidget {
  final NewsListStore store = NewsListStore();
  final bool usual;
  final Function(String selectedImage)? onSelectImage;

  NewsListScreen({super.key, required this.usual, this.onSelectImage}) {
    store.loadNews();
  }

  void onNewsTap(BuildContext context, News news) {
    if (usual) {
      context.push('/news-about', extra: news.id);
    } else {
      if (onSelectImage != null) {
        onSelectImage!(news.image);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Новости'),
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (store.newsList.isEmpty) {
            return Center(child: Text('Нет данных'));
          }
          return NewsListView(
            newsList: store.newsList,
            onNewsTap: (news) => onNewsTap(context, news),
          );
        },
      ),
    );
  }
}