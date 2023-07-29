import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
static const routeName='/filters';
final Function saveFilters;
final Map<String,bool> currentFilters;
FiltersScreen(this.currentFilters,this.saveFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false; 
  @override
  void initState() {
    _glutenFree=widget.currentFilters['gluten'];
    _lactoseFree=widget.currentFilters['lactose'];
    _vegan=widget.currentFilters['vegan'];
    _vegetarian=widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  )
  {
    return SwitchListTile(title: Text(title),
           value:currentValue,
           subtitle: Text(description,
           ),
           onChanged: updateValue,
             
           );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions:<Widget> [
          IconButton(icon: Icon(Icons.save),
          onPressed:(){
            final selectedFilters ={
             'gluten':_glutenFree,
            'vegetarian':_vegetarian,
             'vegan':_vegan,
             'lactose':_lactoseFree,

            };
            widget.saveFilters(selectedFilters);
          } ,
          ),
        
        ],
        ),
      
      drawer: MainDrawer(),
     body:Column(
      children:<Widget> [
        Container(
          padding: EdgeInsets.all(20),
          child: Text
           ('Adjust your meal selection',
           
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(child: ListView(
          children:<Widget> [
           _buildSwitchListTile(
            'Gluten-free',
             'Only include gluten free meal',
              _glutenFree,
               (newValue){
            setState(() {
              _glutenFree=newValue;
            },
            );
           },
           ),
           _buildSwitchListTile(
            'Lactose-free',
             'Only include lactose free meal',
              _lactoseFree,
               (newValue){
            setState(() {
              _lactoseFree=newValue;
            },
            );
           },
           ),
           _buildSwitchListTile(
            'Vegetarian',
             'Only include vegetarian meal',
              _vegetarian,
               (newValue){
            setState(() {
              _vegetarian=newValue;
            },
            );
           },
           ),
           _buildSwitchListTile(
            'Vegan',
             'Only include vegan meal',
              _vegan,
               (newValue){
            setState(() {
              _vegan=newValue;
            },
            );
           },
           ),
          ],
        ),
        ),
      ],
     ),
    );
  }
}