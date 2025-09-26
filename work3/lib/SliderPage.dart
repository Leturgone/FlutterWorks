
import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  final int counter;
  final ValueChanged<int> onChanged;

  const SliderPage({super.key, required this.counter, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Значение: ${counter}', style: TextStyle(fontSize: 24)),
          Slider(
            min: 0,
            max: 100,
            divisions: 100,
            value: counter.toDouble(),
            onChanged: (double newValue) {
              onChanged(newValue.toInt());
            },
          ),
        ],
      ),
    );
  }
}