import 'package:flutter/material.dart';

class bottomNavigationBarTheme {
  bottomNavigationBarTheme._();

  static BottomNavigationBarThemeData LigthBottomNAvigationBar =
      BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 0,
          selectedIconTheme: IconThemeData(
            color: Colors.black,
          ),
          selectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black,
          unselectedIconTheme: IconThemeData(color: Colors.black));
  static BottomNavigationBarThemeData darkBottomNAvigationBar =
      BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          elevation: 0,
          selectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.white,
          unselectedIconTheme: IconThemeData(color: Colors.white));
}
