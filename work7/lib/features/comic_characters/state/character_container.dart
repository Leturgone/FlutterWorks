import 'package:flutter/material.dart';
import '../models/character.dart';
import '../screens/character_list_screen.dart';


enum Screen { list}

class CharacterContainer extends StatefulWidget {
  const CharacterContainer({super.key});

  @override
  State<CharacterContainer> createState() => _CharacterContainerState();
}

class _CharacterContainerState extends State<CharacterContainer> {
  final List<Character> _characterList = [
    Character(id: 10, name: "Iron Man", image: "https://cdn.marvel.com/content/1x/002irm_com_crd_01.jpg"),
    Character(id: 11, name: "Spider Man", image: "https://cdn.marvel.com/content/1x/005smp_com_crd_01.jpg"),
  ];

  Screen _currentScreen = Screen.list;


  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case Screen.list:
        return CharacterListScreen(
          characterList: _characterList,
        );
    }
  }
}