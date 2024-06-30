import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealDeatailsScreen extends StatelessWidget {
  const MealDeatailsScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Meal Deatails'),
      ),
      body: Column(
        children: [],
    ));
  }
}