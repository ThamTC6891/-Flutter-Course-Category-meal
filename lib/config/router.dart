import 'package:category_meal/constant/navigation_constant.dart';
import 'package:category_meal/models/meal.dart';

import 'package:category_meal/screens/category_meals_screen.dart';
import 'package:category_meal/screens/filters_screen.dart';
import 'package:category_meal/screens/meal_detail_screen.dart';
import 'package:category_meal/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Route generateRoute(RouteSettings routeSetting) {
  switch (routeSetting.name) {
    case NavigationConstant.CATEGORY_SCREEN:
      //var f1 = routeSetting.arguments as List<Meal>;
      return buildRoute(routeSetting, CategoryMealsScreen());
    case NavigationConstant.MEAL_DETAIL_SCREEN:
      return buildRoute(routeSetting, MealDetailScreen());
    case NavigationConstant.FILTER_SCREEN:
      var f = routeSetting.arguments as Map<String, bool>;

      return buildRoute(routeSetting, FiltersScreen());
    default:
      return buildRoute(routeSetting, TabsScreen());
  }
}

MaterialPageRoute buildRoute(RouteSettings routeSettings, Widget build) {
  return MaterialPageRoute(
    settings: routeSettings,
    builder: (BuildContext context) => build,
  );
}
