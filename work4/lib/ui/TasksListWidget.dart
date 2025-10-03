
import 'package:flutter/material.dart';

// Экран с задачами (использует Column)

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<String> tasks = List.generate(40, (index) => 'Задача ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: tasks.map((task) => Text(task)).toList(),
      )
    );
  }
}

