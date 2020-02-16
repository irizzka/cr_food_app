import 'package:cr_food_app/screens/categories_screen.dart';
import 'package:cr_food_app/screens/category_meals_screen.dart';
import 'package:cr_food_app/screens/meal_detail_screen.dart';
import 'package:cr_food_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          title: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
        ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: TabsScreen.routeName,
      routes: {
        CategoriesScreen.routeName : (context) => CategoriesScreen(),
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName : (context) => MealDetailScreen(),
        TabsScreen.routeName : (context) => TabsScreen(),
      },
      /*onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute( builder: (ctx) => CategoriesScreen());
      },*/
      onUnknownRoute: (settings) {
        return MaterialPageRoute( builder: (ctx) => CategoriesScreen());
      } ,
    );
  }
}
