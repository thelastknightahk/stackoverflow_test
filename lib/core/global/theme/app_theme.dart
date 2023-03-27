import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sof/core/global/colors/app_colors.dart';

class AppTheme {
  const AppTheme();

  static ThemeData appTheme = ThemeData(
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      primarySwatch: buildMaterialColor(AppColors.secondColor),
      brightness: Brightness.light,
      textTheme: TextTheme(
        bodyText1: GoogleFonts.inter(color: AppColors.titleColor, fontSize: 18),
        caption:
            GoogleFonts.inter(color: AppColors.subtitleColor, fontSize: 12),
        bodyText2: GoogleFonts.inter(
          fontSize: 16,
          color: AppColors.titleColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      iconTheme: IconThemeData(color: AppColors.textColor),
      bottomAppBarColor: Colors.white,
      dividerColor: Colors.black.withOpacity(0.7),
      primaryTextTheme:
          const TextTheme(bodyText2: TextStyle(color: Colors.black))
          
          );
}

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
