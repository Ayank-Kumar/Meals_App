import 'package:flutter/material.dart';
import 'package:meals_app/classes/Meals.dart';
import 'package:meals_app/dummy-data.dart';

import './Screens/MealScreen.dart';
import './Screens/categoryScreen.dart';
import './Screens/meal_Recipe_Screen.dart';
import './Screens/startScreen.dart';
import './Screens/FilterScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  List<Meal> conditionalMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  Map<String,bool> passingFilters = {
    'isGlutenFree': false,
    'isLactoseFree': false,
    'isVegetarian': false,
    'isVegan': false
  };
  void showRightMeals(Map<String,bool> filters) {
    setState(() {
      passingFilters = filters ;
    });
    conditionalMeals = DUMMY_MEALS.where((meal) {
      if(!meal.isGlutenFree && (filters['isGlutenFree'] as bool) ){
        return false;
      }
      if(!meal.isLactoseFree && (filters['isLactoseFree'] as bool) ){
        return false;
      }
      if(!meal.isVegetarian && (filters['isVegetarian'] as bool) ){
        return false;
      }
      if(!meal.isVegan && (filters['isVegan'] as bool) ){
        return false;
      }
      return true ;
    }).toList();
  }

  void makeFavorite(String mealid){
    final firstindex = favoriteMeals.indexWhere((meal) => meal.id==mealid) ;
    if(firstindex>=0){
      setState(() {
        favoriteMeals.removeAt(firstindex) ;
      });
    }else{
      setState(() {
        favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id==mealid)
        ) ;
      });
    }
  }
  bool isFavorite(String mealid){
    return favoriteMeals.any( (meal) => meal.id==mealid ) ;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.lightGreenAccent),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData
            .light()
            .textTheme
            .copyWith(
          bodyText1: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
            fontFamily: 'RobotoCondensed',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
            fontFamily: 'RobotoCondensed',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          subtitle1: const TextStyle(
            fontSize: 15.0,
            color: Color.fromRGBO(20, 51, 51, 1),
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
          headline6: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
      //home: StartScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => StartScreen(favoriteMeals: favoriteMeals),
        //builder function leta ha as argument.- wo function jo widget build krke us widget ko return kre.
        EachMealScreen.routeName: (context) => EachMealScreen(allowedMeals: conditionalMeals),
        CategoryScreen.routeName: (context) => CategoryScreen(),
        MealRecipeScreen.routeName: (context) => MealRecipeScreen(isFavorite: isFavorite,makeFavorite: makeFavorite),
        FilterScreen.routeName: (context) => FilterScreen(adjuster: showRightMeals,filters: passingFilters),
      },
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delhi Meals'),
      ),
      body: const Text('Navigation Time!'),
    );
  }
}
*/
