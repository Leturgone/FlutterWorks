import 'package:work7/features/about_me/widgets/about_me_widget.dart';
import 'package:work7/main_scaffold.dart';

import 'package:flutter/material.dart';

class AboutMeScreen extends StatelessWidget {
  final String name;

  const AboutMeScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      appBar: AppBar(
        title: Text('О разработчике'),
      ),
      body: AboutMeView(name: name),
      currentIndex: 4,
    );
  }
}