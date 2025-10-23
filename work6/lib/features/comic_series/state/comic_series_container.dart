import 'package:flutter/material.dart';
import 'package:work6/features/comic_series/screens/comic_series_about_screen.dart';
import 'package:work6/features/comic_series/screens/comic_series_list_screen.dart';
import 'package:work6/features/shared_data.dart';

import '../models/comic_series.dart';


enum Screen { list, about}

class ComicSeriesContainer extends StatefulWidget {
  const ComicSeriesContainer({super.key});

  @override
  State<ComicSeriesContainer> createState() => _ComicSeriesContainerState();
}

class _ComicSeriesContainerState extends State<ComicSeriesContainer> {
  final List<ComicSeries> _seriesList = SharedData.seriesList;

  ComicSeries? _selectedSeries;
  Screen _currentScreen = Screen.list;


  void _showListScreen() {
    setState(() {
      _currentScreen = Screen.list;
    });
  }

  void _showAboutScreen(ComicSeries comic) {
    setState(() {
      _selectedSeries = comic;
      _currentScreen = Screen.about;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case Screen.list:
        return ComicSeriesListScreen(
          seriesList: _seriesList,
          onSeriesTap: _showAboutScreen,
        );
      case Screen.about:
        if (_selectedSeries == null){
          return Container();
        }else{
          return ComicSeriesAboutScreen(series: _selectedSeries!, onBack: _showListScreen);
        }
    }
  }
}