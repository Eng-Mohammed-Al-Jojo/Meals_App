import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

  static const routName ='meal_detail';

  final Function _toggleFavorite;
  final Function _isMealFavorite;

   MealDetailScreen(this._toggleFavorite, this._isMealFavorite);



  Widget buildSectionTitle(BuildContext context,String text){
    return Container(
      margin:EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child:
      Text(text,style: Theme.of(context).textTheme.title),
    );

  }

  Widget buildContainer(Widget child){
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.red, width: 4),
        borderRadius: BorderRadius.circular(10.0),

      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 350,
      child:child
    );
}


  @override
  Widget build(BuildContext context) {

    final mealId=ModalRoute.of(context).settings.arguments as String;
    final selectedMeal=DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
             buildSectionTitle(context,"Ingredients"),
             buildContainer(ListView.builder(
               itemBuilder:(ctx,index) => Card(
                 color: Theme.of(context).canvasColor,
                 child: Padding(
                   padding: const EdgeInsets.symmetric(vertical:3,horizontal: 10),
                   child: Text(selectedMeal.ingredients[index],style: TextStyle(fontSize: 18),),
                 ),
               ) ,
               itemCount: selectedMeal.ingredients.length,
             ),),
             buildSectionTitle(context,"Steps"),
             buildContainer(
              ListView.builder(
                itemBuilder:(ctx,index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index+1}"),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(
            _isMealFavorite(mealId)? Icons.star : Icons.star_border,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: ()=> _toggleFavorite(mealId),
      ),
    );
  }
}
