import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {

  static const routName ='category_meals';

  final List<Meal> _availableMeals;
  CategoryMealScreen(this._availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;


  @override
  void didChangeDependencies() {
    final routeArg=ModalRoute.of(context).settings.arguments as Map <String ,String>;

    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    /*    */
    displayedMeals=widget._availableMeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();    super.didChangeDependencies();
  }


  void _removeMeal(String mealId){

    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder:(ctx ,index)
    {
      return MealItem(
        id: displayedMeals[index].id,
        ImageUrl: displayedMeals[index].imageUrl,
        title : displayedMeals[index].title,
        duration: displayedMeals[index].duration,
        complexity: displayedMeals[index].complexity,
        affordability: displayedMeals[index].affordability,
      //  removeItem: _removeMeal,

      );
    },
        itemCount: displayedMeals.length,

      ),
    );
  }
}
