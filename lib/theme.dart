import 'package:flutter/material.dart';
import 'package:patient_care/colors.dart';

class PatientCareTheme {
  static standard() {
    return ThemeData(
      textTheme: _textTheme,
      appBarTheme: _appBarTheme,
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevatedButtonThemeData,
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      backgroundColor: PatientCareColors.indigo,
    );
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: PatientCareColors.indigo),
      ),
      border: OutlineInputBorder(),
      floatingLabelStyle: TextStyle(color: PatientCareColors.indigo),
    );
  }

  static TextTheme get _textTheme {
    return const TextTheme(
      headline2: TextStyle(
        fontSize: 28,
        color: PatientCareColors.black,
        fontWeight: FontWeight.w600,
        // fontWeight:
      ),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonThemeData {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(240, 45),
        primary: PatientCareColors.indigo,
      ),
    );
  }
}
