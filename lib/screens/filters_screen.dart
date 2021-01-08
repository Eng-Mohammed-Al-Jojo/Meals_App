import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

final Function saveFilters;
final Map <String, bool> currentFilters;

FiltersScreen(this.currentFilters,this.saveFilters);


  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
     _vegan = widget.currentFilters['vegan'];
     _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }


  Widget buildSwitchListTitle (String title,String description,bool currentValue ,Function updateValue){
    return  SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters ={
                  'gluten':  _glutenFree,
                  'lactose':  _lactoseFree,
                  'vegan':  _vegan,
                  'vegetarian':  _vegetarian,
                };
                widget.saveFilters(selectedFilters);
print(selectedFilters);

              }

              ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
             buildSwitchListTitle("Gluten-free", "Only include Gluten-free meals.", _glutenFree, (newValue){
              setState(() {
              _glutenFree = newValue;
              print(_glutenFree);
                  },);
                 }),

                buildSwitchListTitle("Lactose-free", "Only include Lactose-free meals.", _lactoseFree, (newValue){
              setState(() {
                _lactoseFree = newValue;
                  },);
                 }),

                buildSwitchListTitle("Vegan-free", "Only include Vegan-free meals.", _vegan, (newValue){
              setState(() {
                _vegan = newValue;
                  },);
                 }),

                buildSwitchListTitle("Vegetarian-free", "Only include Vegetarian-free meals.", _vegetarian, (newValue){
              setState(() {
                _vegetarian = newValue;
                  },);
                 }),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
