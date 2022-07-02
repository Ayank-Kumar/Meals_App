import 'package:flutter/material.dart';
import '../Screens/FilterScreen.dart';
class LeftDrawer extends StatelessWidget {
  Widget buildTile(
      {required BuildContext context,
      required VoidCallback change,
      required IconData icone,
      required Color colore,
      required String string}) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        ListTile(
          onTap: change,
          leading: Icon(icone, color: colore),
          title: Text(
            string,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ],
    );
  }

  void filter (BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(FilterScreen.routeName);
  }
  void wapis (BuildContext ctx){
    Navigator.of(ctx).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            border: Border.all(color: Colors.green, width: 3.0),
          ),
          height: 150,
          width: double.infinity,
          child: const Center(
            child: Text(
              'Cooking Up Ya!',
              style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 28.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        buildTile(
          context: context,
          icone: Icons.restaurant,
          colore: Colors.purpleAccent,
          string: 'Meals',
          change: () => wapis(context),
        ),
        buildTile(
          context: context,
          icone: Icons.settings,
          colore: Colors.green,
          string: 'Filters',
          change: () => filter(context) ,
        ),
      ],
    );
  }
}
