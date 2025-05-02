import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Sauberes Inter-Font-Handling mit garantierter FontWeight-Funktionalität. Tipp erhalten von David
/// Workaround für GoogleFonts-Bug: Gewicht wird sonst ignoriert.

abstract class InterTextTheme {
  static final _fontFunction = GoogleFonts.inter;

  static final TextStyle _baseFont = _fontFunction();

  static final TextStyle w100 = _baseFont.copyWith(
    fontFamily: _fontFunction(fontWeight: FontWeight.w100).fontFamily,
  );
  static final TextStyle w200 = _baseFont.copyWith(
    fontFamily: _fontFunction(fontWeight: FontWeight.w200).fontFamily,
  );
  static final TextStyle w300 = _baseFont.copyWith(
    fontFamily: _fontFunction(fontWeight: FontWeight.w300).fontFamily,
  );
  static final TextStyle w400 = _baseFont.copyWith(
    fontFamily: _fontFunction(fontWeight: FontWeight.w400).fontFamily,
  );
  static final TextStyle w500 = _baseFont.copyWith(
    fontFamily: _fontFunction(fontWeight: FontWeight.w500).fontFamily,
  );
  static final TextStyle w600 = _baseFont.copyWith(
    fontFamily: _fontFunction(fontWeight: FontWeight.w600).fontFamily,
  );
  static final TextStyle w700 = _baseFont.copyWith(
    fontFamily: _fontFunction(fontWeight: FontWeight.w700).fontFamily,
  );
  static final TextStyle w800 = _baseFont.copyWith(
    fontFamily: _fontFunction(fontWeight: FontWeight.w800).fontFamily,
  );
  static final TextStyle w900 = _baseFont.copyWith(
    fontFamily: _fontFunction(fontWeight: FontWeight.w900).fontFamily,
  );

  static final TextTheme baseTextTheme = TextTheme(
    displayLarge: w400.copyWith(fontSize: 60, letterSpacing: 0, height: 1.12),
    displayMedium: w900,
    displaySmall: w400,
    headlineLarge: w400,
    headlineMedium: w400,
    headlineSmall: w700.copyWith(fontSize: 30),
    titleLarge: w700,
    titleMedium: w500,
    titleSmall: w500,
    bodyLarge: w400,
    bodyMedium: w400,
    bodySmall: w100,
    labelLarge: w500,
    labelMedium: w500,
    labelSmall: w500,
  );
}
