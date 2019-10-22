import 'package:category_meal/models/meal.dart';

class FavoriteMeal {
  static List<Meal> favoriteMeal = [];
  static set setFavoriteMeal(String mealId) {}
  static List<Meal> get getFavoriteMeal {
    return favoriteMeal;
  }
}
