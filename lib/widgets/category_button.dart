import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:snackish/theme/inter_text_theme.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final bool selected;

  const CategoryButton({Key? key, required this.label, this.selected = false})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 10), // Blur-Effekt
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 11),
            decoration: BoxDecoration(
              color:
                  selected
                      ? const Color.fromARGB(
                        179,
                        255,
                        255,
                        255,
                      ) // #FFFFFF @ 70%
                      : const Color.fromARGB(
                        13,
                        255,
                        255,
                        255,
                      ), // #FFFFFF @ ~5%
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                width: 1.2,
                color:
                    selected
                        ? Colors.transparent
                        : const Color.fromARGB(128, 255, 255, 255), // 50%
              ),
            ),
            child: Text(
              label,
              style: InterTextTheme.w600.copyWith(
                fontSize: 12,

                color: selected ? Colors.black : Colors.white.withAlpha(180),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
