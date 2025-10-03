import 'package:flutter/material.dart';

// Экран с отчетами (использует ListView)

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  List<String> reports = List.generate(40, (index) => 'Отчет ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_,position) => GestureDetector(
        key: ValueKey(reports[position]),
        onTap: () => setState(() => reports.removeAt(position)),
        child: Text(reports[position])),
      itemCount: reports.length,
    );
  }
}