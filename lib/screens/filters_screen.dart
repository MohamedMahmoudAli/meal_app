import 'package:flutter/material.dart';
// import 'package:meal_app/screens/categories_screen.dart';
// import 'package:meal_app/screens/tabs_screen.dart';
// import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
   FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter,bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

// ignore: constant_identifier_names
enum Filter { GlutenFree, LactoseFree, Vegan, Vegetarian }

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  @override
  void initState() {
    isGlutenFree=widget.currentFilters[Filter.GlutenFree]??false;
    isLactoseFree=widget.currentFilters[Filter.LactoseFree]??false; 
    isVegan=widget.currentFilters[Filter.Vegan]??false;
    isVegetarian=widget.currentFilters[Filter.Vegetarian]??false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      // drawer: MainDrawer(
      //   SelectedScreen: (String screen) {
      //     Navigator.pop(context);
      //     if (screen == 'Meals') {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => const TabsScreen()));
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, {
            Filter.GlutenFree: isGlutenFree,
            Filter.LactoseFree: isLactoseFree,
            Filter.Vegan: isVegan,
            Filter.Vegetarian: isVegetarian
          });
          return false;
        },
        child: Column(children: [
          CustomSwitch(
            context,
            'Gluten-free',
            'Only include gluten-free meals',
            isGlutenFree,
            ((value) {
              setState(() {
                isGlutenFree = value;
              });
            }),
          ),
          CustomSwitch(
            context,
            'Lactose-free',
            'Only include Lactose-free meals',
            isLactoseFree,
            ((value) {
              setState(() {
                isLactoseFree = value;
              });
            }),
          ),
          CustomSwitch(
            context,
            'Vegan-free',
            'Only include Vegan-free meals',
            isVegan,
            ((value) {
              setState(() {
                isVegan = value;
              });
            }),
          ),
          CustomSwitch(
            context,
            'Vegetarian-free',
            'Only include Vegetarian-free meals',
            isVegetarian,
            ((value) {
              setState(() {
                isVegetarian = value;
              });
            }),
          ),
        ]),
      ),
    );
  }

  SwitchListTile CustomSwitch(BuildContext context, title, subTitle, filter,
      Function(bool value) onChanged) {
    return SwitchListTile(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        subtitle: Text(
          subTitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        activeColor: Theme.of(context).colorScheme.tertiary,
        value: filter,
        contentPadding: EdgeInsets.only(left: 20, right: 20),
        onChanged: onChanged);
  }
}
