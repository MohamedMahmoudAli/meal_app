import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(
        SelectedScreen: (String screen) {
          Navigator.pop(context);
          if (screen == 'Meals') {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const TabsScreen()));
          }
        },
      ),
      body: Text('Filters'),
    );
  }
}
