import 'package:flutter/material.dart';

class floatingButtonTheme {
  floatingButtonTheme._();

  static final LightFloatingButtonTheme = FloatingActionButtonThemeData(
      hoverElevation: 0,
      focusColor: const Color.fromARGB(255, 238, 238, 238),
      hoverColor: Colors.white,
      focusElevation: 0,
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
  static final darkFloatingButtonTheme = FloatingActionButtonThemeData(
      hoverColor: const Color.fromARGB(255, 37, 37, 37),
      elevation: 0,
      focusElevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
}
