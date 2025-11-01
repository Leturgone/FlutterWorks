import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главная'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.book),
                  iconSize: 50,
                  onPressed: () {context.push('/comic_series');},
                ),
                Text('Серии комиксов')
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.note),
                  iconSize: 50,
                  onPressed: () {context.push('/im_notes');},
                ),
                Text('Заметки о впечатлениях')
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.pages),
                  iconSize: 50,
                  onPressed: () {context.push('/gallery');},
                ),
                Text('Галерея обложек')
              ],
            ),
          ],
        ),
      ),
    );
  }
}