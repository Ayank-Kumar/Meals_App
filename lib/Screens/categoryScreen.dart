import 'package:flutter/material.dart';
import 'package:meals_app/Screens/MealScreen.dart';

import '../dummy-data.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/toCategories';

  void pageSelector(
      {required BuildContext ctx, required String id, required String title}) {
    Navigator.of(ctx).pushNamed(
      EachMealScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(15.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 30.0,
          mainAxisSpacing: 30.0,
        ),
        children: [
          //List of Widget alag mai ek object chahiye. isko bahut sare widgets ek ke baad ek list ke form mai chahiye.
          ...DUMMY_CATEGORIES.map((catData) {
            return InkWell(
              onTap: () => pageSelector(
                  ctx: context, id: catData.id, title: catData.title),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Text(catData.title,
                    style: Theme.of(context).textTheme.headline6),
                decoration: BoxDecoration(
                  color: catData.color,
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                    colors: [
                      catData.color.withOpacity(0.4),
                      catData.color.withOpacity(1.0),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
              ),
            );
          }),
        ],
      );
  }
}
