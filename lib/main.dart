import 'package:flutter/material.dart';
import 'package:todo_r/app_theme.dart';
import 'package:todo_r/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName: (context) => const HomeScreen()},
      theme: AppTheme.lightTheme,
    );
  }
}
