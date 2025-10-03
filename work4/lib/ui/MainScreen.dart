
import 'package:flutter/material.dart';
import 'package:work4/ui/EmployeeListWidget.dart';
import 'package:work4/ui/ReportsListWidget.dart';
import 'package:work4/ui/TasksListWidget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // список виджетов с контентом
    final List<Widget> pages = [
      TasksScreen(),
      ReportsScreen(),
      EmployeeScreen()
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Управление проектом'),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: 'Задачи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: 'Отчеты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            label: 'Сотрудники',
          )
        ],
      ),
    );
  }
}