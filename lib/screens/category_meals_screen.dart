import 'package:category_meal/dummy_data.dart';
import 'package:category_meal/models/meal.dart';
import 'package:category_meal/variable/variable_filter.dart';
import 'package:category_meal/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final List<Meal> availableMeal;
  // CategoryMealsScreen(this.availableMeal);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadInuitData = false;
  List<Meal> _availableMeal = DUMMY_MEALS;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _availableMeal = DUMMY_MEALS.where((meal) {
      if (!meal.isGlutenFree && VariableFilter.isGlutenFree) return false;
      if (!meal.isVegan && VariableFilter.isVegan) return false;
      if (!meal.isVegetarian && VariableFilter.isVegetarian) return false;
      if (!meal.isLactoseFree && VariableFilter.isLactoseFree) return false;
      return true;
    }).toList();
    if (!_loadInuitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = _availableMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadInuitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (context, index) => MealItem(
          id: displayedMeals[index].id,
          title: displayedMeals[index].title,
          imageUrl: displayedMeals[index].imageUrl,
          duration: displayedMeals[index].duration,
          complexity: displayedMeals[index].complexity,
          affordability: displayedMeals[index].affordability,
        ),
      ),
    );
  }
}
