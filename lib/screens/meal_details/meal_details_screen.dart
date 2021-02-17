import 'dart:ui';

import 'package:deli_meals/models/dummy_data.dart';
import 'package:flutter/material.dart';


class MealDetailsScreen extends StatelessWidget {
  static const String ROUT_NAME = '/meal-details';
  final Function toggleFav;
  final Function isFavMeal;

  MealDetailsScreen(this.toggleFav, this.isFavMeal);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealDetails = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${mealDetails.title}'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  mealDetails.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                  itemCount: mealDetails.ingredients.length,
                  itemBuilder: (_, index) => Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(mealDetails.ingredients[index]),
                        ),
                      ),
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(
                  itemCount: mealDetails.steps.length,
                  itemBuilder: (_, index) => Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('# ${index + 1}'),
                            ),
                            title: Text(mealDetails.steps[index]),
                          ),
                          Divider()
                        ],
                      ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavMeal(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFav(mealId),
      ),
    );
  }
}
