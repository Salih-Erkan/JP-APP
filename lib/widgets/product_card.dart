import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snackish/theme/inter_text_theme.dart';
import '../screens/detail_screen.dart';

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
        height: 270,
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Blur-Effekt
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
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
                        SizedBox(height: 5),
                        Container(
                          width: 140,
                          child: Text(
                            description,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: 'inter',
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          '₳ ${price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 105,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              colors: [Color(0xFF90BCF5), Color(0xFFBB8DE1)],
                              center: Alignment.center,
                              radius: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              // Linear-Gradient simuliert mit einem neutralen Mittelwert
                              color: Color.fromARGB(128, 255, 255, 255),
                            ),
                            boxShadow: [
                              // Drop Shadow
                              BoxShadow(
                                color: Color(0x80EA71C5), // 50% opacity
                                offset: Offset(0, 10),
                                blurRadius: 30,
                                spreadRadius: 0,
                              ),
                              // Inner Shadow – simuliert mit negativ spread + darker overlay
                              BoxShadow(
                                color: Color(0xFFFFACE4).withOpacity(0.6),
                                offset: Offset(0, 0),
                                blurRadius: 5,
                                spreadRadius: -1,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                          child: Center(
                            child: Text(
                              'Add to order',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                fontFamily:
                                    'Inter', // oder 'Poppins' oder 'SF Pro' je nach Auswahl
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Burger Bild oben rechts
            Positioned(
              right: 0,
              top: 50,
              child: Image.asset(imagePath, height: 235),
            ),
          ],
        ),
      ),
    );
  }
}
