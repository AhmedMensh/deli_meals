import 'package:deli_meals/models/dummy_data.dart';
import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/screens/categories/categories.dart';
import 'package:deli_meals/screens/categtory_meals/category_meals_screen.dart';
import 'package:deli_meals/screens/filters/filters_screen.dart';
import 'package:deli_meals/screens/meal_details/meal_details_screen.dart';
import 'package:deli_meals/screens/tabs/tabs_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favMeals = [];

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _updateFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      print(filterData);
      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      });
    });
  }

  void _toggleFav(String mealId) {
    int existingIndex = favMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex == -1) {
      setState(() {
        favMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
    setState(() {
      favMeals.removeAt(existingIndex);
    });
  }

  bool isFavMeal(String mealId){

    return favMeals.any((meal)=> meal.id == mealId);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromARGB(255, 51, 51, 1)),
            body2: TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
            title: TextStyle(fontSize: 22, fontFamily: 'OpenSans')),
      ),
      routes: {
        '/': (ctx) => TabsScreen(favMeals),
        CategoryMealsScreen.ROUT_NAME: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MealDetailsScreen.ROUT_NAME: (ctx) => MealDetailsScreen(_toggleFav,isFavMeal),
        FiltersScreen.ROUT_NAME: (ctx) =>
            FiltersScreen(_updateFilters, _filters),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },
    );
  }
}
