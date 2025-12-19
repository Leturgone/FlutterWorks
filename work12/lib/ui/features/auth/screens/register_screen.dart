import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/register_store.dart';
import '../widgets/register_view.dart';


class RegisterScreen extends StatelessWidget {
  final RegisterStore registerStore  = RegisterStore();

  RegisterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Observer(builder: (_) => RegisterView(
          onLoginPressed: () => context.pushReplacement('/login'),
          onRegisterPressed: () => _onRegisterPressed(context),
          username: registerStore.username,
          email: registerStore.email,
          password: registerStore.password,
          confirmPassword: registerStore.confirmPassword,
          onUsernameChanged: registerStore.setUsername,
          onEmailChanged: registerStore.setEmail,
          onPasswordChanged: registerStore.setPassword,
          onConfirmPasswordChanged: registerStore.setConfirmPassword,
          error: registerStore.error,
          isLoading: registerStore.isLoading),
        )
      ),
    );
  }

  void _onRegisterPressed(BuildContext context) async {
    final success = await registerStore.register();
    if (success && context.mounted) {
      context.pushReplacement('/profile');
    }
  }
}