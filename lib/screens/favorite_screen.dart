import 'package:category_meal/variable/favorite_meal.dart';

import 'package:category_meal/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final favoriteMeals = FavoriteMeal.favoriteMeal;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (FavoriteMeal.favoriteMeal.isEmpty)
      return Center(
        child: Text(
          "you have no favorites yet - start adding some!",
          style: Theme.of(context).textTheme.title,
        ),
      );
    else
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) => MealItem(
          id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          imageUrl: favoriteMeals[index].imageUrl,
          duration: favoriteMeals[index].duration,
          complexity: favoriteMeals[index].complexity,
          affordability: favoriteMeals[index].affordability,
        ),
      );
  }
}
