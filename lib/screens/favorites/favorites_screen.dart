import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/screens/categtory_meals/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favMeals;

  FavoritesScreen(this.favMeals);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return Center(
        child: Text("You have no favorites yet!"),
      );
    } else
      return ListView.builder(
          itemCount: favMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(favMeals[index]);
          });
  }
}
