import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work7/features/about_me/state/about_me_container.dart';
import 'package:work7/features/comic_series/state/comic_series_container.dart';
import 'package:work7/features/gallery/state/gallery_container.dart';
import 'package:work7/features/impression_note/state/impression_note_container.dart';
import 'package:work7/features/comic_characters/state/character_container.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final int currentIndex;

  const MainScaffold({super.key, required this.body, this.currentIndex = 0, Row? floatingActionButton, AppBar? appBar});

  void navigateTo(BuildContext context, Widget page) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => page),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Приложение'),
      ),
      body: body,
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Серии'),
              onTap: () => context.go('/'),
            ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text('Впечатления'),
              onTap: () => context.go('/im_notes'),
            ),
            ListTile(
              leading: Icon(Icons.browse_gallery),
              title: Text('Галерея обложек'),
              onTap: () => context.go('/gallery'),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Персонажи'),
              onTap: () => context.go('/characters'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('О разработчке'),
              onTap: () => context.go('/about_me'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.purple),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        onTap: (index) {
          switch (index) {
            case 0: navigateTo(context, ComicSeriesContainer()); break;
            case 1: navigateTo(context, ImpressionNoteContainer()); break;
            case 2: navigateTo(context, ComicGalleryContainer()); break;
            case 3: navigateTo(context, CharacterContainer()); break;
            case 4: navigateTo(context, AboutMeContainer()); break;
          }
        },
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
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Персонажи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'О разработчике',
          )
        ],
      ),
    );
  }
}