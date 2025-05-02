import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/start_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(SnackApp());
}

class SnackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => StartScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
