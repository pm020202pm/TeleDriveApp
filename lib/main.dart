
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tele_drive_app/pages/sign_up_page.dart';
import 'package:tele_drive_app/tools/States/nav_notifier.dart';
import 'Themes/theme.dart';

void main() {
  runApp(

      // DevicePreview(
      //   enabled: true,
      //   tools: [...DevicePreview.defaultTools],
      //   builder: (context) =>

      ProviderScope(child: const MyApp())

      // )
      );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef refer) {
    final appTheme = refer.watch(navProvider);
    return MaterialApp(
      themeMode: appTheme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: 'Flutter Demo',
      theme: AppTheme.LightTheme,
      darkTheme: AppTheme.darkTheme,
      home: SignUpPage(),
    );
  }
}
