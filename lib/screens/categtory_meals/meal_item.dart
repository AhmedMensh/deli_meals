import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/screens/meal_details/meal_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsScreen.ROUT_NAME,arguments: meal.id).then((res){
      print(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Text(
                    meal.title,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(

                    children: <Widget>[
                      Icon(Icons.timer),
                      SizedBox(
                        width: 4,
                      ),
                      Text('${meal.duration} Min')
                    ],
                  ),
                  Row(
                    children: <Widget>[Icon(Icons.work),SizedBox(width: 4,), Text('${meal.complexityName}')],
                  ),
                  Row(
                    children: <Widget>[Icon(Icons.attach_money),SizedBox(width: 4,), Text('${meal.affordabilityName}')],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
