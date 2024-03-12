import 'package:flutter/material.dart';

class bottomSheetTheme {
  bottomSheetTheme._();

  static BottomSheetThemeData LightBottomSheet = BottomSheetThemeData(
    surfaceTintColor: Colors.white,
    //surfaceTintColor: Colors.white,
    showDragHandle: false,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
  );
  static BottomSheetThemeData darkBottomSheet = BottomSheetThemeData(
    surfaceTintColor: const Color.fromARGB(255, 37, 37, 37),
    showDragHandle: false,
    backgroundColor: const Color.fromARGB(255, 37, 37, 37),
    modalBackgroundColor: const Color.fromARGB(255, 37, 37, 37),
  );
}
