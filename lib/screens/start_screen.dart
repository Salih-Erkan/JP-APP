import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:snackish/theme/inter_text_theme.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hintergrundbild
          Positioned.fill(
            child: Image.asset(
              'assets/hintergründe/bg_startscreen.png',
              fit: BoxFit.cover,
            ),
          ),
          // Cupcake-Bild
          Positioned(
            top: 250,
            left: 130,
            right: 0,
            child: Transform.scale(
              scale: 2.0,
              child: Image.asset(
                'assets/grafiken/cupcake_chick.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          // bild "SNACK"
          Positioned(
            top: 480,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/details/snack_snack.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          // Text-Card
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Feeling Snackish Today?',
                        style: InterTextTheme.w900.copyWith(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Explore Angi's most popular snack selection and get instantly happy.",
                          style: InterTextTheme.baseTextTheme.bodyMedium
                              ?.copyWith(
                                fontSize: 13,
                                color: const Color.fromARGB(206, 255, 255, 255),
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 30),
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 65,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFE970C4), Color(0xFFF69EA3)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(
                                    0xFFE970C4,
                                  ).withOpacity(0.65), // Schatten
                                  offset: Offset(
                                    0,
                                    8,
                                  ), // mehr Abstand nach unten
                                  blurRadius: 24,
                                  spreadRadius: 1,
                                ),
                              ],
                              border: Border.all(
                                width: 1,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            child: Text(
                              'Order Now',
                              style: InterTextTheme.w600.copyWith(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
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
