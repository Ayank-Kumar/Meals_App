import 'package:flutter/material.dart';

import '../dummy-data.dart';

class MealRecipeScreen extends StatelessWidget {
  static const routeName = '/toRecipeOfMeal';

  /*void removeCurrent(BuildContext context,String id){
    Navigator.of(context).pop(id) ;
  }
  */
  final Function makeFavorite;

  final Function isFavorite;

  MealRecipeScreen({required this.makeFavorite, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final mealid = args['id'];

    Widget label(String s) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: double.infinity,
        child: Center(
          child: Text(s, style: Theme.of(context).textTheme.bodyText2),
        ),
      );
    }

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        onPressed: () => makeFavorite(mealid as String),
        child: Icon((!isFavorite(mealid as String) ? Icons.favorite_border_outlined : Icons.favorite ),
            color: Colors.pinkAccent),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            label('Ingredients'),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                itemBuilder: (ctx, idx) {
                  return Card(
                    color: Colors.greenAccent,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 4.0),
                        child: Center(
                            child: Text(
                          selectedMeal.ingredients[idx],
                          style: Theme.of(context).textTheme.subtitle1,
                        ))),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            label('Steps'),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                itemBuilder: (ctx, idx) {
                  return Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Column(
                      children: [
                        Text(
                          '${idx + 1}. ${selectedMeal.steps[idx]}',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
