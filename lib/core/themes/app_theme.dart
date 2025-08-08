import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData lightTheme =
      ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black87,
        // primaryColor: AppColors.primaryColor,
      );

  static final ThemeData darkTheme =
      ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black87,
        // primaryColor: AppColors.primaryColor,
      );
}
