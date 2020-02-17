import 'package:cr_food_app/models/meal.dart';
import 'package:cr_food_app/screens/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static final routeName = '/category-meals';

  final List<Meal> _availableMeals;


  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;


  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
      super.didChangeDependencies();
      final routeArgs =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget._availableMeals.where((el) {
        return el.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
  }

  void _removeItem(String mealId){
    setState(() {
      displayedMeals.removeWhere((el)=> el.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            removeItem: _removeItem,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
