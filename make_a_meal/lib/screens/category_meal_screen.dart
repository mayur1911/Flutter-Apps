import 'package:flutter/material.dart';
import 'package:make_a_meal/widgets/meal_item.dart';

import '../dummy_data.dart';
import '../models/meals.dart';

class CategoryMealScreen extends StatefulWidget {
  static final routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      final recipie = routeArgs['recipie'];
      // Previously, before applying filtering logic --  displayedMeals = DUMMY_MELAS.where((meal)
      displayedMeals = widget.availableMeals.where((meal) {  
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedData = true;
    }

    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        titleTextStyle:
            TextStyle(color: Colors.purple, backgroundColor: Colors.green),
        foregroundColor: Colors.red,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        // ignore: missing_return
        itemBuilder: (cxt, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            removeItem: _removeItem,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}

/* ListView.builder(
          // ignore: missing_return
          itemBuilder: (cxt, index) {
            Text(categoryMeals[index].title+"hiii");
          },
          itemCount: categoryMeals.length,
        ),);
 */
/* body: Center(
        child: Text(
          recipie,
        ),
      ), */
