import 'package:flutter/material.dart';
import 'package:snackish/theme/inter_text_theme.dart';
import '../screens/detailScreen/detail_screen.dart';

class RecommendedCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;

  const RecommendedCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heroTag = 'hero_${title.replaceAll(' ', '_').toLowerCase()}';

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder:
              (context) => DetailScreen(
                title: title,
                description: description,
                imagePath: imagePath,
                price: price,
                heroTag: heroTag,
              ),
        );
      },
      child: Container(
        width: 200,
        height: 270,
        margin: const EdgeInsets.fromLTRB(0, 16, 16, 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.41, 1.0],
            colors: [
              Color.fromARGB(63, 255, 255, 255),
              Color(0xFF908CF5),
              Color(0xFF8C5BEA),
            ],
          ),
          border: Border.all(color: Colors.white54, width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: heroTag,
                child: Image.asset(imagePath, height: 160, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 1),
            Text(
              title,
              style: InterTextTheme.w700.copyWith(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₳ ${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(
                  Icons.favorite_border,
                  size: 16,
                  color: Colors.white54,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
