import 'package:auth_ui/auth/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth UI for ACE Broadcasr',
      theme: lightMode,
      darkTheme: darkMode,
      home: LoginPage(),
    );
  }
}

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: const Color(0xFFF1411B),
    secondary: Colors.grey.shade200,
    tertiary: const Color(0xFF19244D),
    surfaceDim: Colors.grey,
    inversePrimary: Colors.black,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color(0xFF121212),
    primary: const Color(0xFFF0370F),
    tertiary: const Color.fromARGB(255, 46, 79, 199),
    secondary: Colors.grey.shade900,
    surfaceDim: Colors.grey.shade800,
    inversePrimary: Colors.white,
  ),
);
