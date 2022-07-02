import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/classes/Meals.dart';

import 'FavouritScreen.dart';
import 'categoryScreen.dart';
import '../individual_Items/main_drawer.dart';

class StartScreen extends StatefulWidget {
  List<Meal> favoriteMeals ;
  StartScreen({required this.favoriteMeals}) ;
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int pageIdx = 0 ;
  var pages ;
  @override
  void initState() {
    pages = [
      CategoryScreen(),
      FavouriteScreen(favoriteMeals: widget.favoriteMeals,),
    ] ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('DELHI MEALS'),
          ),
        ),
        drawer: Drawer(
          child: LeftDrawer(),
        ),
        body: pages[pageIdx],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (idx) {
            setState(() {
                pageIdx = idx ;
            });
          },
          currentIndex: pageIdx,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.white,
          //showUnselectedLabels: true,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(backgroundColor: Theme.of(context).colorScheme.primary,icon: Icon(Icons.category_outlined),label: 'Categories'),
            BottomNavigationBarItem(backgroundColor: Theme.of(context).colorScheme.primary,icon: Icon(Icons.favorite) ,label: 'Favourite') ,
          ],
        ),
      ),
    );
  }
}
