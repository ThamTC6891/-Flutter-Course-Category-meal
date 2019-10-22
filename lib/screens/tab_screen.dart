import 'package:category_meal/screens/categories_screen.dart';
import 'package:category_meal/screens/favorite_screen.dart';
import 'package:category_meal/widgets/bottom_navigation.dart';
import 'package:category_meal/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pageItems = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoriteScreen(),
      'title': 'Favorites',
    },
  ];
  int selectPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageItems[selectPage]['title']),
      ),
      drawer: MainDrawer(),
      body: pageItems[selectPage]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 70,
          child: BottomNavigation(
            onTap: (index) {
              setState(() {
                selectPage = index;
              });
            },
          ),
        ),
        color: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
