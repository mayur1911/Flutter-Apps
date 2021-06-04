import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meals.dart';

import 'screens/categories_screen.dart';
import 'screens/category_meal_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/filters_screen.dart';

void main() => runApp(MyApp());

//  Here, MyApp is to change to statful from statless due TO ,
//  applying filter swithes need NOT to load whole again & again,
//  As filter swich takes actions on multiple screens, which are possiible to take in main.dart only
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluteenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (filters['gluteenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My app title',
      theme: ThemeData(
          accentColor: Colors.amber,
          primarySwatch: Colors.pink,
          canvasColor: Color.fromRGBO(240, 235, 240, 0.98),
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 40, 80, 0.95),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(60, 40, 150, 0.85),
              ),
              title: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold))),
      // home: CategoriesScreen(),
      // home can also be routed  using '/' : CategoriesScreen()
      // This is home page i.e  which ever widget class is written here is 1 st screen page loaded when app just opened
      initialRoute: '/',
      routes: {
        // Here, routes is Map with routeName as 'key' and builder_function as 'value'
        '/': (ctx) => TabsScreen(),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeal),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(setFilters(filters)),
      },
      onGenerateRoute: (settings) {
        // This route is taken when pushNamed() couldn't find the route from "routes" list.
        print(settings.arguments);
        //if (settings.name == '/meal-details'){
        //  return ....
        //return MaterialPageRoute(builder: (ctx) => CategoriesScreen() );
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        // Here, if flutter dont find any Route,
        // instead of throwing an error, it will take unknownRoute
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make-a-Meal'),
      ),
      body: Center(
        child: Text("Welcome to home page"),
      ),
    );
  }
}
