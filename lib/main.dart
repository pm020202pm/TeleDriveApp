
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tele_drive_app/pages/folderPage.dart';
import 'package:tele_drive_app/pages/homePage.dart';
import 'package:tele_drive_app/pages/sign_up_page.dart';
import 'package:tele_drive_app/tools/States/nav_notifier.dart';
import 'package:tele_drive_app/tools/navigationbar.dart';
import 'Themes/theme.dart';

void main() {
  runApp(
      const ProviderScope(child: MyApp())
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(navProvider);
    return MaterialApp(
      themeMode: appTheme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: 'Flutter Demo',
      theme: AppTheme.LightTheme,
      darkTheme: AppTheme.darkTheme,
      // home: MyHome1(),
      home: MyHomePage(),
    );
  }
}
