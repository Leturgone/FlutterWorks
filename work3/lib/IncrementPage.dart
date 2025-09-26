
import 'package:flutter/material.dart';

class IncrementPage extends StatelessWidget{
  final int counter;
  final VoidCallback onIncrement;

  const IncrementPage({super.key, required this.counter, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.tealAccent,
        padding: EdgeInsets.all(80.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: onIncrement,
          child: Text(
            style: TextStyle(color: Colors.black),
              'Увеличить счетчик на 10 (Текущий: $counter)'
          ),
        ),
      )
    );
  }
}