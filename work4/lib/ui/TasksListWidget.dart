
import 'package:flutter/material.dart';

// Экран с задачами (использует Column)

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<String> tasks = ['Задача 1', 'Задача 2', 'Задача 3', 'Задача 4', 'Задача 5', 'Задача 6',
    'Задача 7', 'Задача 8', 'Задача 9', 'Задача 10', 'Задача 11', 'Задача 12', 'Задача 13'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: tasks.map((task) => Text(task)).toList(),
    );
  }
}

