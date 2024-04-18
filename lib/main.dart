import 'package:daangn/screens/main_screen.dart';
import 'package:daangn/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'carrot_market_ui',
      home: MainScreen(),
      theme: theme(),
    );
  }
}
