import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {

  final String id;
  final String title;
  final Color color;

  const CategoryItem( this.id, this.title, this.color);

  void selectCategory(BuildContext ctx){
  Navigator.of(ctx).pushNamed(CategoryMealScreen.routName,
  arguments: {
    'id':id,
    'title':title,
  },
  );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.6),
              color,
                 ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

  }
}
