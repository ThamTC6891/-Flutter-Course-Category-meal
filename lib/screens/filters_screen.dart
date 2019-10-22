import 'package:category_meal/variable/variable_filter.dart';
import 'package:category_meal/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  // final Function saveFilters;
  // FiltersScreen(this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  static bool glutenFree = false;
  static bool vegan = false;
  static bool vegetarian = false;
  static bool lactoseFree = false;
  Widget _buildSwitchListTile(
      String title, bool currenValue, Function updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
      value: currenValue,
      onChanged: updateValue,
      activeColor: Colors.green,
      inactiveTrackColor: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  "Gluten-Free",
                  glutenFree,
                  (newValue) {
                    setState(() {
                      glutenFree = newValue;
                      VariableFilter.isGlutenFree = glutenFree;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegan",
                  vegan,
                  (newValue) {
                    setState(() {
                      vegan = newValue;
                      VariableFilter.isVegan = vegan;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegetarian",
                  vegetarian,
                  (newValue) {
                    setState(() {
                      vegetarian = newValue;
                      VariableFilter.isVegetarian = vegetarian;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "lactoseFree",
                  lactoseFree,
                  (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                      VariableFilter.isLactoseFree = lactoseFree;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
