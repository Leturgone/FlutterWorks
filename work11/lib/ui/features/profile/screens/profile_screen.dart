

import 'package:flutter/material.dart';
import '../stores/profile_store.dart';
import '../widgets/features_view.dart';
import '../widgets/profile_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileStore store = ProfileStore();

  ProfileScreen({super.key}){
    store.loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
      ),
      body: Column(
        children: [
          Observer(
            builder: (_) {
              if (store.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              final user = store.user;
              if (user == null) {
                return Center(child: Text('Нет данных'));
              }
              return ProfileView(user: user);
            },
          ),
          FeaturesView()
        ],
      ),
    );
  }
}