import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      width: 550,
      height: 250,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              //decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
              width: double.infinity,
              height: 250,
              margin: EdgeInsets.all(10),
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                    elevation: 5,
                    margin: EdgeInsets.all(5),
                    color: Colors.amber.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('${selectedMeal.ingredients[index]}'),
                    )),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    hoverColor: Colors.blue,
                    focusColor: Colors.red[800],
                    tileColor: Colors.green[100],
                    contentPadding: EdgeInsets.all(10),
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text('${selectedMeal.steps[index]}'),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete_forever_rounded),
        onPressed: () {
          Navigator.of(context).pop(mealId);      // Here flutter doesn't know which page is to pop, so we pass argument to tell about that
        },
      ),
    );
  }
}
