import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

const KinatielFilters = {
  Filter.GlutenFree: 'Gluten-free',
  Filter.LactoseFree: 'Lactose-free',
  Filter.Vegan: 'Vegan',
  Filter.Vegetarian: 'Vegetarian'
};

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> SelectedFilter = {
    Filter.GlutenFree: false,
    Filter.LactoseFree: false,
    Filter.Vegan: false,
    Filter.Vegetarian: false
  };
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleFavoriteMealStatus(Meal meal) {
    final bool _isExisting = _favoriteMeals.contains(meal);
    if (_isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Removed from favorites');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('Added to favorites');
      });
    }
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) {
    if (identifier == 'Filters') {
      Navigator.pop(context);
      Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  FiltersScreen(
                currentFilters:SelectedFilter
              )))
          .then((value) {
        setState(() {
          SelectedFilter = value ?? KinatielFilters;
        });
        log(value.toString());
      });
    } else if (identifier == 'Meals') {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals=dUMMYMEALS.where((element) {
      if(SelectedFilter[Filter.GlutenFree]! && !element.isGlutenFree){
        return false;
      }
      if(SelectedFilter[Filter.LactoseFree]! && !element.isLactoseFree){
        return false;
      }
      if(SelectedFilter[Filter.Vegan]! && !element.isVegan){
        return false;
      }
      if(SelectedFilter[Filter.Vegetarian]! && !element.isVegetarian){
        return false;
      }
      return true;
    },).toList();
    Widget activeScreen = CategoriesScreen(

      onToggleFavorite: _toggleFavoriteMealStatus, availableMeals: availableMeals,
    );
    String title = 'Categories';
    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(
        title: '',
        meal: _favoriteMeals,
        onToggleFavorite: _toggleFavoriteMealStatus,
      );
      title = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: activeScreen,
      drawer: MainDrawer(SelectedScreen: _setScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
