import 'package:flutter/material.dart';
import 'package:work7/features/about_me/screens/about_me_screen.dart';

enum Screen { about}

class AboutMeContainer extends StatefulWidget {
  const AboutMeContainer({super.key});

  @override
  State<AboutMeContainer> createState() => _AboutMeContainerState();
}

class _AboutMeContainerState extends State<AboutMeContainer> {
  final String name = "ИКБО-07-22 Яснецов Ф.И";

  Screen _currentScreen = Screen.about;

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case Screen.about:
        return AboutMeScreen(name: name);
    }
  }
}