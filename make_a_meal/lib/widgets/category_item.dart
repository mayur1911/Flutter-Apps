import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String recipie;

  CategoryItem(this.id, this.title, this.color, this.recipie);

  void selectMealPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName , arguments: {
      'id': id,
      'title': title,
      'recipie': recipie,
    });
  }

  /* void selectMealPage(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (_) {
          return CategoryMealScreen(id, title, recipie);
        },
      ),
    );
  }
 */
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMealPage(context),
      splashColor: Colors.lightBlue,
      borderRadius: BorderRadius.circular(20),
      child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color,
                color.withOpacity(0.6),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
