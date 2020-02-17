import 'package:cr_food_app/screens/categories_screen.dart';
import 'package:cr_food_app/screens/category_meals_screen.dart';
import 'package:cr_food_app/screens/favorites_screen.dart';
import 'package:cr_food_app/screens/filters_screen.dart';
import 'package:cr_food_app/screens/meal_detail_screen.dart';
import 'package:cr_food_app/screens/tabs_screen.dart';
import 'package:cr_food_app/utils/dummy_data.dart';
import 'package:flutter/material.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegetarian' : false,
    'vegan' : false,

  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;

      _availableMeals =DUMMY_MEALS.where((el){
        if(_filters['gluten'] && !el.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !el.isLactoseFree){
          return false;
        }
        if(_filters['vegetarian'] && !el.isVegetarian){
          return false;
        }
        if(_filters['vegan'] && !el.isVegan){
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((el) => el.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() { _favoriteMeals.add(
        DUMMY_MEALS.firstWhere((el) => el.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((el) => el.id == id);
  }

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
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName : (context) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        TabsScreen.routeName : (context) => TabsScreen(_favoriteMeals),
        FiltersScreen.routeName : (context) => FiltersScreen(_setFilters, _filters),
        FavoriteScreen.routeName : (context) => FavoriteScreen(_favoriteMeals),
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute( builder: (ctx) => CategoriesScreen());
      } ,
    );
  }
}

