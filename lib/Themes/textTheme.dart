import 'package:flutter/material.dart';

class textTheme {
  textTheme._();

  static TextTheme LightTextTheme = TextTheme(
    headlineLarge: const TextStyle()
        .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: const TextStyle()
        .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
    headlineSmall: const TextStyle()
        .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
    titleLarge: const TextStyle()
        .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: const TextStyle()
        .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: const TextStyle()
        .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
    bodyLarge: const TextStyle()
        .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
    bodyMedium: const TextStyle()
        .copyWith(fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5)),
    labelLarge: const TextStyle()
        .copyWith(fontWeight: FontWeight.normal, color: Colors.black),
    labelMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5)),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle()
        .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: const TextStyle()
        .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: const TextStyle()
        .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
    titleLarge: const TextStyle()
        .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: const TextStyle()
        .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: const TextStyle()
        .copyWith(fontWeight: FontWeight.w400, color: Colors.white),
    bodyLarge: const TextStyle()
        .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: const TextStyle()
        .copyWith(fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5)),
    labelLarge: const TextStyle()
        .copyWith(fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.5)),
  );
}
