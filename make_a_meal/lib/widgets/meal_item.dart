import 'package:flutter/material.dart';
import 'package:make_a_meal/screens/meal_detail_screen.dart';
import '../models/meals.dart';
import '../dummy_data.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  const MealItem({
    this.id,
    this.title,
    this.imageUrl,
    this.duration,
    this.complexity,
    this.affordability,
    this.removeItem,
  });

  void viewMealDetails(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {          // Here result = id  ( argument value )
      if (result != null) {
        removeItem(id);
      }
    });
  }

  String get affordabilityText {
    // Same can be done using if-else :
    switch (affordability) {
      case Affordability.Affordable_to_any_one:
        return 'Affordable to any one';
        break;
      case Affordability.All_at_home:
        return 'All at home';
        break;
      case Affordability.For_special_occasions_only:
        return 'For special occasions only';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Not_for_middle_class:
        return 'Not  for  middle  class';
        break;
      case Affordability.Royal:
        return 'Royal';
        break;
      default:
        return 'Unknown';
    }
  }

  String get complexityText {
    // Same can be done using if-else :
    switch (complexity) {
      case Complexity.Easy:
        return 'Easy';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Insane:
        return 'Insane';
        break;
      case Complexity.Little_Challenging:
        return 'Little  Challenging';
        break;
      case Complexity.Only_for_Chef:
        return 'Only  for  Chef';
        break;
      case Complexity.Simple:
        return 'Simple';
        break;
      default:
        return 'Beginner';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber,
      onTap: () => viewMealDetails(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 10,
                  child: Container(
                    width: 350,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          backgroundColor: Colors.black45,
                          fontWeight: FontWeight.w400),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 8,
                      ),
                      Text('$duration  min'),
                    ],
                  ),
                  // SizedBox(width: 30,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 4,
                      ),
                      Text('$complexityText'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.attach_money),
                  SizedBox(
                    width: 4,
                  ),
                  Text('$affordabilityText'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
