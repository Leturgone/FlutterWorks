import 'package:flutter/material.dart';

// Экран с сотрудиками (использует ListView.separated )

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  List<String> tasks = List.generate(40, (index) => 'Сотрудник ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_,position) => Text(tasks[position]),
      separatorBuilder: (_,_) => const Divider(),
      itemCount: tasks.length,
    );
  }
}