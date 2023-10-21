import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcc/theme/colors.dart';
import 'package:jcc/theme/texts.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkMidnightBlue),
      useMaterial3: true,
      textTheme: const TextTheme(
        displayLarge: AppTexts.displayLarge,
        displayMedium: AppTexts.displayMedium,
        displaySmall: AppTexts.displaySmall,
        headlineLarge: AppTexts.headlineLarge,
        headlineMedium: AppTexts.headlineMedium,
        headlineSmall: AppTexts.headlineSmall,
        titleLarge: AppTexts.titleLarge,
        titleMedium: AppTexts.titleMedium,
        titleSmall: AppTexts.titleSmall,
      ),
    );
  }
}
