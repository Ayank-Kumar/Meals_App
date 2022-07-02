import 'package:flutter/material.dart';

import '../Screens/meal_Recipe_Screen.dart';
import '../classes/Meals.dart';

class meal_Item extends StatelessWidget {
  final String id;

  final String title;

  final String imageURL;

  final int duration;

  final Complexity complexity;

  final Affordability affordability;

  //final Function removeMeal;

  const meal_Item(
      {required this.complexity,
      required this.id,
      required this.affordability,
      required this.title,
      required this.duration,
      //required this.removeMeal,
      required this.imageURL});

  String get costFactor {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  String get toughFactor {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'God Knows!';
    }
  }

  void changer({required BuildContext ctx, required String id}) {
    Navigator.of(ctx).pushNamed(
      MealRecipeScreen.routeName,
      arguments: {
        'id': id,
      },
    );//.then((id) => removeMeal(id));
  }

  Widget allrow(
      {required BuildContext context,
      required Color color,
      required IconData iconData,
      required String string}) {
    return Row(
      children: [
        Icon(
          iconData,
          color: color,
        ),
        const SizedBox(
          width: 2.0,
        ),
        Text(
          string,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => changer(ctx: context, id: id),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        margin: const EdgeInsets.all(15.0),
        elevation: 10.0,
        //shadowColor: Colors.greenAccent,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Stack(
                children: [
                  Image.network(imageURL),
                  Positioned(
                    bottom: 10.0,
                    right: 5.0,
                    child: Card(
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule_rounded,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        '${duration} min',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  allrow(
                      context: context,
                      color: Colors.brown,
                      iconData: Icons.work,
                      string: toughFactor),
                  allrow(
                      context: context,
                      color: Colors.green,
                      iconData: Icons.attach_money,
                      string: costFactor),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
