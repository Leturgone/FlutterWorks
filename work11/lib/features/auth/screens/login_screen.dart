
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work11/features/auth/widgets/login_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/login_store.dart';

class LoginScreen extends StatelessWidget {
  final LoginStore loginStore = LoginStore();

  LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Observer(builder: (_) => LoginView(
          onRegisterPressed: () => context.pushReplacement('/register'),
          onLoginPressed: () => _onLoginPressed(context),
          email: loginStore.email,
          password: loginStore.password,
          onEmailChanged: loginStore.setEmail,
          onPasswordChanged: loginStore.setPassword,
          error: loginStore.error,
          isLoading: loginStore.isLoading)
        ),
      ),
    );
  }

  void _onLoginPressed(BuildContext context) async {
    final success = await loginStore.login();

    if (success && context.mounted) {
      context.pushReplacement('/profile');
    }
  }
}