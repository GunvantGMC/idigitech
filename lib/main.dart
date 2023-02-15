import 'package:flutter/material.dart';
import 'package:idigitech/Pages/CategoryPage.dart';
import 'package:idigitech/Pages/HomePage.dart';
import 'package:idigitech/Pages/ShoppingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I Digitech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      // home: const CategoryPage(),
      // home: const ShoppingPage(),
    );
  }
}
