import 'package:flutter/material.dart';
import 'package:work6/features/comic_series/state/comic_series_container.dart';
import 'package:work6/features/gallery/state/gallery_container.dart';

import 'features/impression_note/state/impression_note_container.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ComicSeriesContainer(),
    ImpressionNoteContainer(),
    ComicGalleryContainer()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Серии',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: 'Впечатления',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.browse_gallery),
              label: 'Галерея обложек',
            ),
          ],
        ),
      ),
    );
  }
}