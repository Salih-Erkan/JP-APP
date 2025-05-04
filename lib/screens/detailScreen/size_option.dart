import 'dart:ui';
import 'package:flutter/material.dart';

class SizeOption extends StatelessWidget {
  final String label;
  final bool selected;
  final bool isFirst;

  const SizeOption({
    Key? key,
    required this.label,
    required this.selected,
    this.isFirst = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius radius;

    if (isFirst) {
      // Immer links abrunden, egal ob selected oder nicht
      radius = const BorderRadius.only(
        topLeft: Radius.circular(8),
        bottomLeft: Radius.circular(8),
      );
    } else if (selected) {
      radius = BorderRadius.circular(8); // Nur wenn ausgewählt
    } else {
      radius = BorderRadius.zero; // Keine Rundung
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color:
            selected ? Colors.white.withAlpha(50) : Colors.white.withAlpha(20),
        borderRadius: radius,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
