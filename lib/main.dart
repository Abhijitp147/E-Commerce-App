import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';
import 'package:shop_app_flutter/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App ',
        theme: ThemeData(
          fontFamily: GoogleFonts.lato().fontFamily,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
