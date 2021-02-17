import 'package:deli_meals/screens/tabs/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const ROUT_NAME = 'filters';

  final Function updateFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.updateFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.filters['gluten'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    _lactoseFree = widget.filters['lactose'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Adjust your meal selection',
                  style: Theme.of(context).textTheme.title),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SwitchListTile(
                    activeColor: Colors.pink,
                    title: Text('Gluten Free'),
                    value: _glutenFree,
                    subtitle: Text('Only include gluten free meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Colors.pink,
                    title: Text('Lactose Free'),
                    value: _lactoseFree,
                    subtitle: Text('Only include lactose free meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Colors.pink,
                    title: Text('Vegetarian'),
                    value: _vegetarian,
                    subtitle: Text('Only include vegetarian meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Colors.pink,
                    title: Text('Vegan'),
                    value: _vegan,
                    subtitle: Text('Only include vegan meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: FlatButton.icon(
                      onPressed: () {
                        widget.updateFilters({
                          'gluten': _glutenFree,
                          'lactose': _lactoseFree,
                          'vegan': _vegan,
                          'vegetarian': _vegetarian,
                        });
                      },
                      icon: Icon(Icons.filter),
                      label: Text('Filter'),
                      color: Colors.pink,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
