import 'package:blood_nation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Nation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffC31C2B)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}