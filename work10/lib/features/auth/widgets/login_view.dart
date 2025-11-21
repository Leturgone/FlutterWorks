
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final VoidCallback onRegisterPressed;
  final VoidCallback onLoginPressed;
  final String? error;
  final bool isLoading;
  final String email;
  final String password;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;

  const LoginView({
    super.key,
    required this.onRegisterPressed,
    required this.onLoginPressed,
    required this.email,
    required this.password,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    this.error,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Войдите в аккаунт',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),

        TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: const Icon(Icons.email),
            errorText: error,
          ),
          onChanged: onEmailChanged,
          controller: TextEditingController(text: email)
            ..selection = TextSelection.collapsed(offset: email.length),
        ),
        const SizedBox(height: 20),

        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: const Icon(Icons.lock),
            errorText: error,
          ),
          onChanged: onPasswordChanged,
          controller: TextEditingController(text: password)
            ..selection = TextSelection.collapsed(offset: password.length),
        ),
        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLoading ? null : onLoginPressed,
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text('Войти'),
          ),
        ),
        const SizedBox(height: 10),

        TextButton(
          onPressed: onRegisterPressed,
          child: const Text('Нет аккаунта? Зарегистрируйтесь'),
        ),

        if (error != null)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              error!,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}