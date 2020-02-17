import 'package:cr_food_app/models/meal.dart';
import 'package:cr_food_app/screens/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  static final String routeName = '/favorites';

  final List<Meal> _favoriteMeals;

  FavoriteScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {

    if(_favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet'),
      );
    }else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: _favoriteMeals[index].id,
            title: _favoriteMeals[index].title,
            imageUrl: _favoriteMeals[index].imageUrl,
            affordability: _favoriteMeals[index].affordability,
            complexity: _favoriteMeals[index].complexity,
            duration: _favoriteMeals[index].duration,
          );
        },
        itemCount: _favoriteMeals.length,
      );
    }
  }
}
