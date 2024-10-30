import 'package:flutter/material.dart';
import 'package:taskly/theme/colors.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.bgDark,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(22),
      enabledBorder: _border(Colors.orange),
      focusedBorder: _border(Colors.orange.shade100),
      errorBorder: _border(Colors.red),
    ),
  );
}
