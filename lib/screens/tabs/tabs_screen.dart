import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/screens/categories/categories.dart';
import 'package:deli_meals/screens/favorites/favorites_screen.dart';
import 'package:deli_meals/screens/tabs/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favMeals;

  TabsScreen(this.favMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [CategoriesScreen(), FavoritesScreen(widget.favMeals)];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Deli Meals',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _pages[_selectedPageIndex],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories')),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favorites')),
        ],
      ),
    );
  }
}
// DefaultTabController(
// length: 2,
// child: Scaffold(
// appBar: AppBar(
// title: Text('Meal'),
// bottom: TabBar(
// labelColor: Colors.white,
// unselectedLabelColor: const Color(0xffacb3bf),
// indicatorPadding: EdgeInsets.all(0.0),
// indicator: ShapeDecoration(
// shape: UnderlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 0,
// style: BorderStyle.solid)),
// gradient: LinearGradient(colors: [Colors.pink, Colors.amber])),
// tabs: <Widget>[
// Tab(
// icon: Icon(Icons.category),
// text: 'Categories',
// ),
// Tab(
// icon: Icon(Icons.star),
// text: 'Favorites',
// )
// ],
// ),
// ),
// body: TabBarView(
// children: <Widget>[CategoriesScreen(), FavoritesScreen()],
// ),
// ),
// );
