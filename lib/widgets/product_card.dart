import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snackish/theme/inter_text_theme.dart';
import '../screens/detailScreen/detail_screen.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;

  const ProductCard({
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
        height: 265,
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Blur-Effekt
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(color: Colors.transparent),
                ),
              ),
            ),

            // SVG-Hintergrund darüber
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: SvgPicture.asset(
                  'assets/grafiken/top_card.svg',
                  fit: BoxFit.fill,
                ),
              ),
            ),

            // ⭐ Stern & Bewertung oben rechts
            Positioned(
              top: 24,
              right: 24,
              child: Row(
                children: [
                  Image.asset(
                    'assets/grafiken/star.png',
                    height: 16,
                    width: 16,
                    color: const Color(0xFFE970C4), // pink
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    '4.8',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Inhalte
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  // Textbereich
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: InterTextTheme.w700.copyWith(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          description,
                          style: InterTextTheme.w500.copyWith(
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '₳ ${price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 105,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: const RadialGradient(
                              colors: [Color(0xFF90BCF5), Color(0xFFBB8DE1)],
                              center: Alignment.center,
                              radius: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: Color.fromARGB(128, 255, 255, 255),
                            ),
                            boxShadow: [
                              const BoxShadow(
                                color: Color(0x80EA71C5),
                                offset: Offset(0, 10),
                                blurRadius: 30,
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: const Color(0xFFFFACE4).withOpacity(0.6),
                                offset: Offset(0, 0),
                                blurRadius: 5,
                                spreadRadius: -1,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                          child: const Center(
                            child: Text(
                              'Add to order',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Produktbild oben rechts (mit Hero)
            Positioned(
              right: 0,
              top: 50,
              child: Hero(
                tag: heroTag,
                child: Image.asset(imagePath, height: 235),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
