import 'package:category_meal/constant/navigation_constant.dart';
import 'package:category_meal/models/meal.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'UnKnow';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'UnKnow';
    }
  }

  _selectMealDetail(BuildContext context) {
    Navigator.pushNamed(
      context,
      NavigationConstant.MEAL_DETAIL_SCREEN,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMealDetail(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(10)),
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 26),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(width: 5),
                    Text(
                      '$duration min',
                    ),
                  ]),
                  Row(children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(width: 5),
                    Text(
                      complexityText,
                    ),
                  ]),
                  Row(children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(width: 5),
                    Text(
                      affordabilityText,
                    ),
                  ]),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            )
          ],
        ),
      ),
    );
  }
}
