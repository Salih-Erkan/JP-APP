import 'package:flutter/material.dart';

class InfoIconColumn extends StatelessWidget {
  final String title;
  final List<IconData> icons;
  final String? trailing;

  const InfoIconColumn({
    Key? key,
    required this.title,
    required this.icons,
    this.trailing,
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
          children: [
            ...icons.map(
              (icon) => Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(icon, size: 18, color: Colors.white),
              ),
            ),
            if (trailing != null)
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  trailing!,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
