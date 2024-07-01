import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_deatails_screen.dart';
import 'package:meal_app/widgets/mealItem.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meal, required this.onToggleFavorite});
  final String? title;
  final List<Meal> meal;
  final Function onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: meal
              .map((meal) => MealItem(
                    onselectMeal: (meal) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => MealDeatailsScreen(meal: meal, onToggleFavorite: ((meal) => onToggleFavorite(meal)),)));
                    },
                    meal: meal,
                  ))
              .toList()),
    );
  }
}
