import 'dart:ui';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton({Key? key, required this.icon, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,

          color: Colors.white.withAlpha(18),
          border: Border.all(color: Colors.white.withAlpha(50), width: 1),
        ),
        child: Icon(icon, color: Colors.white70, size: 20),
      ),
    );
  }
}
