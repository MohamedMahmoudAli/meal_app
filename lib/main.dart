import 'package:flutter/material.dart';
import 'package:meal_app/widgets/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark,
              seedColor: const Color.fromARGB(255, 125, 0, 0)),
              useMaterial3: true
              
              ),
              
      home: const CategoriesScreen(),
    );
  }
}
