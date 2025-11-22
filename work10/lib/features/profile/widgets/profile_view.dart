import 'package:flutter/material.dart';

import '../models/user.dart';

class ProfileView extends StatelessWidget {
  final User user;

  const ProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Пользователь: ${user.username}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Количество заметок: ${user.notesCount}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}