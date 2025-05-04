import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:snackish/screens/detailScreen/info_icon_column.dart';
import 'package:snackish/screens/detailScreen/info_image_column.dart';
import 'package:snackish/screens/detailScreen/round_icon_button.dart';
import 'package:snackish/screens/detailScreen/size_option.dart';
import 'package:snackish/theme/inter_text_theme.dart';

class DetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;
  final String heroTag;

  const DetailScreen({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            top: 145,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(color: const Color.fromARGB(243, 47, 43, 34)),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Hero(
              tag: heroTag,
              child: Image.asset(imagePath, height: 400, fit: BoxFit.contain),
            ),
          ),

          Positioned(
            top: 165,
            right: 16,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withAlpha(40)),
                ),
                child: const CircleAvatar(
                  radius: 12,
                  backgroundColor: Color.fromARGB(243, 47, 43, 34),
                  child: Icon(Icons.close, color: Colors.white70, size: 20),
                ),
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.34,
            left: 24,
            right: 24,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(29, 20, 29, 40),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(83, 47, 43, 34),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withAlpha(20),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withAlpha(15),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.white.withAlpha(120),
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '200',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Hauptinhalt
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 18),
                          Text(
                            title,
                            style: InterTextTheme.w900.copyWith(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.',
                            textAlign: TextAlign.center,
                            style: InterTextTheme.w300.copyWith(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '₳ ${price.toStringAsFixed(2)}',
                            style: InterTextTheme.w700.copyWith(
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            height: 18,
                            color: Color.fromARGB(100, 255, 255, 255),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InfoImageColumn(
                                title: "Ingredients",
                                imagePaths: [
                                  'assets/grafiken/wheat.png',
                                  'assets/grafiken/sugar.png',
                                  'assets/grafiken/lowfat.png',
                                  'assets/grafiken/fire.png',
                                ],
                              ),
                              InfoIconColumn(
                                title: "Reviews",
                                icons: [
                                  Icons.star,
                                  Icons.star,
                                  Icons.star,
                                  Icons.star,
                                  Icons.star_border,
                                ],
                                trailing: '4.0',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 760,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    SizeOption(label: "Small", selected: false, isFirst: true),
                    SizeOption(label: "Medium", selected: false),
                    SizeOption(label: "Large", selected: true),
                  ],
                ),
                Row(
                  children: [
                    RoundIconButton(icon: Icons.remove, onPressed: () {}),
                    const SizedBox(width: 16),
                    const Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 16),
                    RoundIconButton(icon: Icons.add, onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),

          // "Add to order"-Button
          Positioned(
            bottom: 45,
            left: 24,
            right: 24,
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFE970C4), Color(0xFFF69EA3)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFE970C4).withOpacity(0.65),
                        offset: const Offset(0, 8),
                        blurRadius: 24,
                        spreadRadius: 1,
                      ),
                    ],
                    border: Border.all(
                      width: 1,
                      color: Colors.white.withAlpha(175),
                    ),
                  ),
                  child: Text(
                    'Add to order for ₳ ${price.toStringAsFixed(2)}',
                    style: InterTextTheme.w600.copyWith(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
