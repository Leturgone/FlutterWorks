
import 'package:flutter/material.dart';
import 'package:work3/CounterPage.dart';
import 'package:work3/DoublePage.dart';
import 'package:work3/IncrementPage.dart';
import 'package:work3/SliderPage.dart';
import 'package:work3/SquarePage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  int _counter = 0;

  void _updateCounter(int newCounter) {
    setState(() {
      _counter = newCounter;
    });
  }

  void _onIncrement() {
    setState(() {
      _counter += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    // список виджетов с контентом
    final List<Widget> pages = [
      CounterPage(counter: _counter),
      DoublePage(counter: _counter),
      IncrementPage(counter: _counter, onIncrement: _onIncrement),
      SliderPage(counter: _counter, onChanged: _updateCounter),
      SquarePage(counter: _counter),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Переключение контента'),
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
            label: 'Счетчик',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: 'Рассчет',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            label: 'Увеличение счетчика',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_4),
            label: 'Слайдер',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_5),
            label: 'Квадрат и куб',
          ),
        ],
      ),
    );
  }
}
