import 'package:flutter/material.dart';

import 'router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router,
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5EFE1),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF790D16)
      ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF790D16),
          foregroundColor: Colors.white,
    ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF790D16),
          foregroundColor: Colors.white
        )
      )));
  }
}
