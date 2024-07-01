import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.SelectedScreen});
  final Function (String screen) SelectedScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Container(
            padding: const EdgeInsets.all(0),
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(.8),
            ])),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Icon(Icons.fastfood),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Meals App',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary),
                  )
                ],
              ),
            ),
          )),
          ListTile(
            onTap: () {
              SelectedScreen("Meals");
              
            },
            leading: Icon(Icons.restaurant),
            iconColor: Theme.of(context).colorScheme.primary,
            title: Text(
              "Meals",
              style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          ListTile(
            onTap: () {
              SelectedScreen("Filters");
            },
            leading: const Icon(Icons.settings),
            iconColor: Theme.of(context).colorScheme.primary,
            title: Text(
              "Filters",
              style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
        ],
      ),
    );
  }
}
