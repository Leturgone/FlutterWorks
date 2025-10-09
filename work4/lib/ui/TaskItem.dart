
import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget{
  final String text;
  const TaskItem({super.key, required this.text});

  @override
  State<StatefulWidget> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem>{
  late String text;
  
  @override
  void initState() {
    super.initState();
    text = widget.text;
  }
  @override
  Widget build(BuildContext context) {
    return Text(text);
  }

}