
import 'package:work7/features/comic_characters/widgets/character_list_view.dart';
import 'package:work7/main_scaffold.dart';

import 'package:flutter/material.dart';

import '../models/character.dart';

class CharacterListScreen extends StatelessWidget {
  final List<Character> characterList;

  const CharacterListScreen({super.key, required this.characterList});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      appBar: AppBar(
        title: Text('Серии комиксов'),
      ),
      body: CharacterListView(characterList: characterList,),currentIndex: 3,
    );
  }
}