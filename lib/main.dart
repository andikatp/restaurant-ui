import 'package:flutter/material.dart';
import 'package:restaurant/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food Delivery UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.deepOrangeAccent,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.deepOrangeAccent,
              secondary: Colors.deepOrangeAccent,
            ),
        appBarTheme: const AppBarTheme(color: Colors.deepOrangeAccent),
      ),
      home: const HomeScreen(),
    );
  }
}
