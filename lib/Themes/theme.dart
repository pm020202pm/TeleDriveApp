import 'textTheme.dart';
import 'floatingButtonTheme.dart';
import 'bottomSheetTheme.dart';
import 'bottomNavgifationBarTheme.dart';
import 'package:flutter/material.dart';
class AppTheme {
  AppTheme._();

  static ThemeData LightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      textTheme: textTheme.LightTextTheme,
      floatingActionButtonTheme: floatingButtonTheme.LightFloatingButtonTheme,
      bottomSheetTheme: bottomSheetTheme.LightBottomSheet,
      iconTheme: IconThemeData(color: Colors.black),
      bottomNavigationBarTheme:
          bottomNavigationBarTheme.LigthBottomNAvigationBar,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.black)),
          elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: Colors.white,foregroundColor: Colors.black)));
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      textTheme: textTheme.darkTextTheme,
      floatingActionButtonTheme: floatingButtonTheme.darkFloatingButtonTheme,
      bottomSheetTheme: bottomSheetTheme.darkBottomSheet,
      iconTheme: IconThemeData(color: Colors.white),
      bottomNavigationBarTheme:
          bottomNavigationBarTheme.darkBottomNAvigationBar,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.white)));
}
