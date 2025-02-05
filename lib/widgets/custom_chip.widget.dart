import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final Color? color;

  const CustomChoiceChip({super.key, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      labelStyle: TextStyle(color: color),
    );
  }
}
