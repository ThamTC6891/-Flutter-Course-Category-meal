import 'package:flutter/material.dart';

import 'constant/navigation_constant.dart';

class CategoriesItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoriesItems(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategories(context),
      splashColor: Theme.of(context).primaryColorDark,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              color,
              color.withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  void _selectCategories(BuildContext context) {
    Navigator.pushNamed(
      context,
      NavigationConstant.CATEGORY_SCREEN,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }
}
