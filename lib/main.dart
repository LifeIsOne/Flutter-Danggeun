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
      home: Scaffold(
        body: Center(
          child: const Text("메인화면"),
        ),
      ),
    );
  }
}
