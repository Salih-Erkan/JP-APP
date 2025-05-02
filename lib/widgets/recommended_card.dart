import 'package:flutter/material.dart';
import '../screens/detail_screen.dart';

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
              ),
        );
      },
      child: Container(
        width: 200,
        height: 280,
        margin: EdgeInsets.fromLTRB(0, 16, 16, 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.41, 1.0],
            colors: [
              Color.fromARGB(63, 255, 255, 255), // transparentes Weiß (7%)
              Color(0xFF908CF5), // 61%
              Color(0xFF8C5BEA), // 100%
            ],
          ),
          border: Border.all(color: Colors.white.withAlpha(100), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(imagePath, height: 160, fit: BoxFit.contain),
            ),
            SizedBox(height: 1),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₳ ${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(Icons.favorite_border, size: 16, color: Colors.white54),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
