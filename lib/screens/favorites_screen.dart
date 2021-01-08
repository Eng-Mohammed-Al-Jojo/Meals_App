import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';
class FavoritesScreen extends StatelessWidget {

  final List <Meal> _favoriteMeals;

  FavoritesScreen(this._favoriteMeals);


  @override
  Widget build(BuildContext context) {

    if(_favoriteMeals.isEmpty){
      return Center(
          child: Text("favorites"),
      );
    }else{

      return  ListView.builder(
        itemBuilder:(ctx ,index)
        {
          return MealItem(
            id: _favoriteMeals[index].id,
            ImageUrl: _favoriteMeals[index].imageUrl,
            title : _favoriteMeals[index].title,
            duration: _favoriteMeals[index].duration,
            complexity: _favoriteMeals[index].complexity,
            affordability: _favoriteMeals[index].affordability,

          );
        },
        itemCount: _favoriteMeals.length,

      );
    }


  }
}
