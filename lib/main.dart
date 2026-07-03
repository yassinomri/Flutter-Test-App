import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const LeRevenuApp());
}

class LeRevenuApp extends StatelessWidget {
  const LeRevenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Revenu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0B3D91),
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}