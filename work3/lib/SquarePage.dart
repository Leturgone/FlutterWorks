
import 'dart:math';

import 'package:flutter/material.dart';

class SquarePage extends StatelessWidget{
  final int counter;

  const SquarePage({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    int square = pow(counter, 2).toInt();
    int cube = pow(counter, 3).toInt();
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Квадрат счетчика: $square',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Куб счетчика: $cube',
                style: TextStyle(fontSize: 20),
              ),
            ]
        )
    );
  }

}