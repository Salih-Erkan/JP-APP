import 'package:flutter/material.dart';

class InfoImageColumn extends StatelessWidget {
  final String title;
  final List<String> imagePaths;

  const InfoImageColumn({
    Key? key,
    required this.title,
    required this.imagePaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 11, color: Colors.white70),
        ),
        const SizedBox(height: 8),
        Row(
          children:
              imagePaths.map((path) {
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Image.asset(
                    path,
                    height: 24,
                    width: 24,
                    color: Colors.white,
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
