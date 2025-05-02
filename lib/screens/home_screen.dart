import 'package:flutter/material.dart';
import 'package:snackish/theme/inter_text_theme.dart';
import 'package:snackish/widgets/category_button.dart';
import '../widgets/product_card.dart';
import '../widgets/recommended_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hintergrundbild
          Positioned.fill(
            child: Image.asset(
              'assets/hintergründe/bg_mainscreen.png',
              fit: BoxFit.cover,
            ),
          ),
          // Hauptinhalt
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Choose Your Favorite\nSnack',
                    style: InterTextTheme.w900.copyWith(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Kategorien (Dummy Buttons)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CategoryButton(
                          label: 'All categories',
                          selected: false,
                        ),
                        CategoryButton(label: 'Salty', selected: true),
                        CategoryButton(label: 'Sweet', selected: false),
                        CategoryButton(label: 'Sweet', selected: false),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  // Produktkarte: Burger
                  ProductCard(
                    imagePath: 'assets/grafiken/burger.png',
                    title: "Angi's Yummy Burger",
                    description: "Delish vegan burger that tastes like heaven",
                    price: 13.99,
                  ),
                  SizedBox(height: 30),
                  // We Recommend
                  Text(
                    'We Recommend',
                    style: InterTextTheme.w900.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Empfehlungen Grid
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        RecommendedCard(
                          imagePath: 'assets/grafiken/cupkake_cat.png',
                          title: "Mogli's Cup",
                          description: "Strawberry ice cream",
                          price: 8.99,
                        ),
                        RecommendedCard(
                          imagePath: 'assets/grafiken/icecream.png',
                          title: "Balu's Cup",
                          description: "Pistachio ice cream",
                          price: 8.99,
                        ),
                        // Weitere Cards hier ...
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
