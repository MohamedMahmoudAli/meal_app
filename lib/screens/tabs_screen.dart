import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  void _toggleFavoriteMealStatus(Meal meal){
    final bool _isExisting=_favoriteMeals.contains(meal);
    if(_isExisting){
      setState(() {
        _favoriteMeals.remove(meal);
      });
      
    }else{
      setState(() {
        _favoriteMeals.add(meal);
      });
    }
  }
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen =  CategoriesScreen(onToggleFavorite: _toggleFavoriteMealStatus,);
    String title = 'Categories';
    if (_selectedPageIndex == 1) {
      activeScreen =  MealsScreen(
        title: '',
        meal: [], onToggleFavorite: _toggleFavoriteMealStatus,
      );
      title = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: activeScreen,
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
