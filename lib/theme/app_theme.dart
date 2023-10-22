
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcc/theme/colors.dart';
import 'package:jcc/theme/texts.dart';

class AppTheme {
  static ThemeData getTheme(){
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkMidnightBlue),
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily,
    );
  }
}