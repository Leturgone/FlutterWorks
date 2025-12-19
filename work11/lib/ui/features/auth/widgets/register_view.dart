
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onRegisterPressed;
  final String? error;
  final bool isLoading;
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final ValueChanged<String> onUsernameChanged;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<String> onConfirmPasswordChanged;

  const RegisterView({
    super.key,
    required this.onLoginPressed,
    required this.onRegisterPressed,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.onUsernameChanged,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onConfirmPasswordChanged,
    this.error,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Создайте аккаунт',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),

        TextField(
          decoration: InputDecoration(
            labelText: 'Имя пользователя',
            prefixIcon: const Icon(Icons.person),
          ),
          onChanged: onUsernameChanged,
          controller: TextEditingController(text: username)
            ..selection = TextSelection.collapsed(offset: username.length),
        ),
        const SizedBox(height: 20),

        TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: const Icon(Icons.email)
          ),
          onChanged: onEmailChanged,
          controller: TextEditingController(text: email)
            ..selection = TextSelection.collapsed(offset: email.length),
        ),
        const SizedBox(height: 20),

        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Пароль',
            prefixIcon: const Icon(Icons.lock),
            errorText: error,
          ),
          onChanged: onPasswordChanged,
          controller: TextEditingController(text: password)
            ..selection = TextSelection.collapsed(offset: password.length),
        ),
        const SizedBox(height: 20),

        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Подтвердите пароль',
            prefixIcon: const Icon(Icons.lock_outline),
            errorText: error,
          ),
          onChanged: onConfirmPasswordChanged,
          controller: TextEditingController(text: confirmPassword)
            ..selection = TextSelection.collapsed(offset: confirmPassword.length),
        ),
        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLoading ? null : onRegisterPressed,
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text('Зарегистрироваться'),
          ),
        ),
        const SizedBox(height: 10),

        TextButton(
          onPressed: onLoginPressed,
          child: const Text('Уже есть аккаунт? Войдите'),
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