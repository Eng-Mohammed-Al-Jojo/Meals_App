import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {

  final List <Meal> _favoriteMeals;

  TabsScreen(this._favoriteMeals);


  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

   List <Map<String,Object>> _pages;

  int  _selectedPageIndex =0;
  @override
  void initState() {
    _pages=  [
      {
        'page': CategoriesScreen(),
        'title':'Categories',
      },
      {
        'page': FavoritesScreen(widget._favoriteMeals),
        'title':'Your Favorite',
      },
    ];    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex=value;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
      drawer: MainDrawer(),

    );
  }


}
