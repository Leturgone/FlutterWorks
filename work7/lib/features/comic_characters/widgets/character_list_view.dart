import 'package:flutter/material.dart';
import 'package:work7/features/comic_characters/models/character.dart';

import 'character_tile.dart';


class CharacterListView extends StatelessWidget {
  final List<Character> characterList;

  const CharacterListView({super.key, required this.characterList});

  @override
  Widget build(BuildContext context) {
    if (characterList.isEmpty) {
      return const Center(
        child: Text(
          'Список персонажей пуст',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: characterList.length,
      itemBuilder: (context, index) {
        final character = characterList[index];
        return CharacterTile(key: ValueKey(character.id),character: character,);
      },
    );
  }
}
