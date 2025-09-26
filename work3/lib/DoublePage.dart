
import 'package:flutter/material.dart';

class DoublePage extends StatelessWidget{
  final int counter;

  const DoublePage({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    int doubleVal = counter * 2;
    int tripleVal = counter * 3;
    int fourVal = counter * 4;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Text(
            'Двойное значение: $doubleVal',
            style: TextStyle(
                fontSize: 24,color: Colors.pink
            ),
          ),
          Text(
            'Тройное значение: $tripleVal',
            style: TextStyle(fontSize: 20,color: Colors.pinkAccent)
          ),
          Text(
            'Четверное значение: $fourVal',
            style: TextStyle(fontSize: 16,color: Colors.purple),
          ),
        ]
    );
  }

}