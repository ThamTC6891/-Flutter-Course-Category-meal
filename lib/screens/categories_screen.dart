import 'package:category_meal/dummy_data.dart';
import 'package:flutter/material.dart';

import '../category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categoriesItems = DUMMY_CATEGORIES.map((catData) {
      return CategoriesItems(
        catData.id,
        catData.title,
        catData.color,
      );
    }).toList();
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        itemCount: categoriesItems.length,
        itemBuilder: (BuildContext context, int index) {
          return categoriesItems[index];
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
