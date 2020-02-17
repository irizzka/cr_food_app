import 'package:cr_food_app/screens/filters_screen.dart';
import 'package:cr_food_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(IconData iconP, String textP, Function tapHandlerP) {
    return ListTile(
      leading: Icon(
        iconP,
        size: 26,
      ),
      title: Text(
        textP,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandlerP,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: const Text(
              'Coocking Up',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          _buildListTile(Icons.restaurant, 'Meals', () => {
            Navigator.of(context).pushReplacementNamed(TabsScreen.routeName),
          }),
          _buildListTile(Icons.settings, 'Filter', () => {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName),
          })
        ],
      ),
    );
  }
}
