
import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget{
  final int counter;
  const CounterPage({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Текущий счетчик: $counter',
        style: TextStyle(fontSize: 32, color: Colors.green),
      ),
    );
  }
}