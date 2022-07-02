import 'package:flutter/material.dart';
import '../individual_Items/main_drawer.dart';

class FilterScreen extends StatefulWidget {

  static const routeName = '/toFilters';
  final Function adjuster ;
  final Map<String,bool> filters ;
  FilterScreen({required this.adjuster,required this.filters}) ;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  Widget buildSwitchListTile({
    required bool switchVal,
    required String type,
    required String description,
    required Function func ,
  }) {
    return Column(
      children: [
        SwitchListTile(
          dense: false,
          tileColor: Colors.purpleAccent.withOpacity(0.25),
          title: Text(type,style: Theme.of(context).textTheme.headline6),
          activeColor: Colors.amberAccent,
          subtitle: Text(description,style: Theme.of(context).textTheme.bodyText1),
          value: switchVal,
          //ek function jo new value lega as argument.
          onChanged: (val) => {
            func(val) ,
          } ,
        ),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(onPressed: () => widget.adjuster(widget.filters), icon: Icon(Icons.save_sharp,color: Theme.of(context).colorScheme.secondary,) )
        ],
      ),
      drawer: Drawer(
        child: LeftDrawer(),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                'Adjust Your Meal Select ions',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText2,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                children: [
                  buildSwitchListTile(switchVal: widget.filters['isGlutenFree'] as bool,
                      type: 'Gluten-Free',
                      func: (value) {
                    setState(() {
                      widget.filters['isGlutenFree'] = value ;
                    });
                      },
                      description: 'Only include Gluten-Free meals'),
                  buildSwitchListTile(switchVal: widget.filters['isLactoseFree'] as bool,
                      type: 'Lactose-Free',
                      func: (value) {
                        setState(() {
                          widget.filters['isLactoseFree'] = value ;
                        });

                      },
                      description: 'Only include Lactose-Free meals'),
                  buildSwitchListTile(switchVal: widget.filters['isVegetarian'] as bool,
                      type: 'Vegetarian',
                      func: (value) {
                        setState(() {
                          widget.filters['isVegetarian'] = value ;
                        });
                      },
                      description: 'Only include Vegetarian meals'),
                  buildSwitchListTile(switchVal: widget.filters['isVegan'] as bool,
                      type: 'Vegan',
                      func: (value) {
                        setState(() {
                          widget.filters['isVegan'] = value ;
                        });
                      },
                      description: 'Only include Vegan meals'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
