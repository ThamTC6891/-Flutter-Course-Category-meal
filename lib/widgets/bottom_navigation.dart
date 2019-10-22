import 'package:category_meal/models/bar_item.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final Function onTap;
  BottomNavigation({this.onTap});
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<BarItem> _barItem = const [
    BarItem(iconData: Icons.category, title: "Category", color: Colors.red),
    BarItem(iconData: Icons.favorite, title: "Favorites", color: Colors.orange),
  ];
  int selectBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 50),
      child: Row(
        children: _buildBottomBar(),
      ),
    );
  }

  List<Widget> _buildBottomBar() {
    List<Widget> barItems = List();
    for (int i = 0; i < _barItem.length; i++) {
      bool _isSelect = selectBarIndex == i;
      barItems.add(InkWell(
        onTap: () {
          setState(() {
            selectBarIndex = i;
            widget.onTap(selectBarIndex);
          });
        },
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            color: _isSelect
                ? _barItem[i].color.withOpacity(0.3)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                _barItem[i].iconData,
                color: _isSelect ? _barItem[i].color : Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                _isSelect ? _barItem[i].title : "",
                style: TextStyle(
                    color: _isSelect ? _barItem[i].color : Colors.black,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ));
    }
    return barItems;
  }
}
