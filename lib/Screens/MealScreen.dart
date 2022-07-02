import 'package:flutter/material.dart';

import '../classes/Meals.dart';
import '../individual_Items/meal_Item.dart';

class EachMealScreen extends StatefulWidget {
  static const routeName = '/towards_Meals';
  final List<Meal> allowedMeals ;
  EachMealScreen({required this.allowedMeals});
  @override
  State<EachMealScreen> createState() => _EachMealScreenState();
}

class _EachMealScreenState extends State<EachMealScreen> {
  // [] used to denote a list .
  List<Meal> categoryMeals = [] ;
  String categoryTitle = '';
  bool passed = false ;
  @override
  void didChangeDependencies() {
    if(!passed){
      //ye pura grp ek dusre se interconnected to ek saath hi chalenge.
      final args =
      ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = args['title'] as String;
      final categoryId = args['id'];
      categoryMeals = widget.allowedMeals.where(
            (meal) {
          return meal.categories.contains(categoryId);
        },
      ).toList();
      passed =  true ;
    }
    super.didChangeDependencies();
  }
  void removeMeal(String id) {
    setState(() {
      categoryMeals.removeWhere( (meal_Item) => meal_Item.id==id) ;
    }); ;
  }

  @override
  Widget build(BuildContext context) {
    //ye null check ka kuchh jyada hi scene ha.hme pata ha na ki kabhi null nhi hoga.
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        actions: const [
          Icon(Icons.ac_unit),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = categoryMeals[index];
          return meal_Item(
            //removeMeal: removeMeal,
            id: item.id,
            complexity: item.complexity,
            affordability: item.affordability,
            duration: item.duration,
            title: item.title,
            imageURL: item.imageUrl,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
