
import 'package:flutter/material.dart';

// Экран с сотрудиками (использует ListView.separated )

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  List<String> employees = List.generate(40, (index) => 'Сотрудник ${index + 1}');

  int counter = 40;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_,position) => GestureDetector(
          key: ValueKey(employees[position]),
          onDoubleTap: () => setState(() => employees.add('Сотрудник ${counter = counter+1}')),
          onTap: () => setState(() {employees.removeAt(position);}),
          child: Text(employees[position])),
      separatorBuilder: (_,_) => const Divider(),
      itemCount: employees.length,
    );
  }
}