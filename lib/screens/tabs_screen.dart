import 'package:cr_food_app/screens/categories_screen.dart';
import 'package:cr_food_app/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {

  static final String routeName = '/tabs-screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DeliMeal'),
          bottom: TabBar(
            indicatorColor: Colors.red,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.category), text: 'Categories',),
              Tab(icon: Icon(Icons.star), text: 'Favorites',)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoriteScreen()
          ],
        ),
      ),

    );
  }
}
