import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/screens/categtory_meals/meal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String ROUT_NAME = "/category-meals";

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    var routsArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    String id = routsArgs['id'];
    String title = routsArgs['title'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(categoryMeals[index]);
          }),
    );
  }
}
