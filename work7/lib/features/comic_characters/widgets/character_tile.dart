import 'package:flutter/material.dart';

import '../models/character.dart';

class CharacterTile extends StatelessWidget {
  final Character character;

  const CharacterTile({super.key, required this.character});


  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: character.name,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: ListTile(
          leading: Image.network(
            character.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(
            character.name,
          ),
        ),
      ),
    );
  }
}