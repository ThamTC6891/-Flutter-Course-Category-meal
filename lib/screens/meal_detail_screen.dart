import 'package:category_meal/dummy_data.dart';
import 'package:category_meal/models/meal.dart';
import 'package:category_meal/variable/favorite_meal.dart';

import 'package:flutter/material.dart';

class MealDetailScreen extends StatefulWidget {
  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget buildSelectTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(top: 10),
      child: child,
    );
  }

  var favoriteMeal = FavoriteMeal.favoriteMeal;
  bool _isFavoriteMeal(String mealId) {
    return favoriteMeal.any((meal) => meal.id == mealId);
  }

  _toggleFavoriteMeal(String mealId) {
    final existingIndex = favoriteMeal.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0)
      setState(() {
        favoriteMeal.removeAt(existingIndex);
      });
    else
      setState(() {
        favoriteMeal.insert(
            0, DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealSelect =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId, orElse: () => null);
    return Scaffold(
      appBar: AppBar(
        title: Text('${mealSelect.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              //height: 300,
              width: double.infinity,
              child: Image.network(mealSelect.imageUrl),
            ),
            buildSelectTitle(context, 'ingredients'),
            buildContainer(
              ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: mealSelect.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        mealSelect.ingredients[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            buildSelectTitle(context, 'steps'),
            buildContainer(ListView.builder(
              itemCount: mealSelect.steps.length,
              itemBuilder: (context, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text("# ${index + 1}"),
                    ),
                    title: Text(
                      mealSelect.steps[index],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isFavoriteMeal(mealId) ? Icons.favorite : Icons.favorite_border,
          color: Colors.red.withOpacity(0.8),
        ),
        onPressed: () => _toggleFavoriteMeal(mealId),
      ),
    );
  }
}
