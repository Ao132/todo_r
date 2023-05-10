import 'package:flutter/material.dart';
import 'package:todo_r/theme/app_theme.dart';
import 'package:todo_r/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings = const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  await FirebaseFirestore.instance.disableNetwork();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {HomeScreen.routeName: (context) => HomeScreen()},
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
