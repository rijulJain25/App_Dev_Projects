import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilter;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters ,this.saveFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _builderSwitchList(
      String title, String desc, bool currentVal, Function updateVal) {
    return SwitchListTile(
      title: Text(title),
      value: currentVal,
      subtitle: Text(desc),
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(
              onPressed: () { 
                final selectedFilters ={
                    'gluten':_glutenFree,
                    'lactose':_lactoseFree,
                    'vegan':_vegan,
                    'vegetarian':_vegetarian,
                };
                widget.saveFilter(
                  selectedFilters
                );
              }, 
              icon: Icon(Icons.save)
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Customize the meal you want to see",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _builderSwitchList(
                    'Gluten Free', 
                    'Only include Gluten Free meals', 
                    _glutenFree, 
                    (newVal) {
                      setState(() {
                        _glutenFree = newVal;
                      });
                    }
                  ),

                  Divider(),
                  _builderSwitchList(
                    'Lactose Free', 
                    'Only include Lactose Free meals', 
                    _lactoseFree, 
                    (newVal) {
                      setState(() {
                        _lactoseFree = newVal;
                      });
                    }
                  ),

                  Divider(),
                  _builderSwitchList(
                    'Vegetarian', 
                    'Only include vegetarian meals', 
                    _vegetarian, 
                    (newVal) {
                      setState(() {
                        _vegetarian = newVal;
                      });
                    }
                  ),

                  Divider(),
                  _builderSwitchList(
                    'Vegan', 
                    'Only include vegan meals', 
                    _vegan, 
                    (newVal) {
                      setState(() {
                        _vegan = newVal;
                      });
                    }
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
