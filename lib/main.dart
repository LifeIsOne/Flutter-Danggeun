import 'package:daangn/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.yellow,
        textTheme: TextTheme(
          displayLarge:
              GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
          displayMedium: GoogleFonts.openSans(
              fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
          bodyLarge: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black),
          bodyMedium: GoogleFonts.openSans(fontSize: 14.0, color: Colors.black),
          titleMedium:
              GoogleFonts.openSans(fontSize: 15.0, color: Colors.black),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: false,
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: GoogleFonts.nanumGothic(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black54,
          showUnselectedLabels: true,
        ),
        primarySwatch: Colors.orange,
      ),
    );
  }
}
