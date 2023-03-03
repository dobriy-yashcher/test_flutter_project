import 'package:flutter/material.dart';
import 'package:test_project/pages/auth_page.dart';
import 'package:test_project/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const AuthPage(),
        'home': (context) => const HomePage(),
      },
    );
  }
}
