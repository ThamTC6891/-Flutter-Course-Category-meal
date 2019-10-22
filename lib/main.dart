import 'package:category_meal/config/router.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(250, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.dark().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',

      onGenerateRoute: generateRoute,
    );
  }
}
