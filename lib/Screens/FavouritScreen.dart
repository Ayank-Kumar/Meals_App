import 'package:flutter/material.dart';
import 'package:meals_app/classes/Meals.dart';
import '../individual_Items/meal_Item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals ;
  FavouriteScreen({required this.favoriteMeals}) ;
  @override
   Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      ) ;
    }else {
      return ListView.builder(
      itemBuilder: (context, index) {
        final item = favoriteMeals[index];
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
      itemCount: favoriteMeals.length,
    );
    }
  }
}
