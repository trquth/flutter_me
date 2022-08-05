import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/card1.dart';
import 'package:flutter_complete_guide/card2.dart';
import 'package:flutter_complete_guide/card3.dart';
import 'package:flutter_complete_guide/models/models.dart';
import 'package:flutter_complete_guide/screens/explore_screen.dart';
import 'package:flutter_complete_guide/screens/grocery_screen.dart';
import 'package:flutter_complete_guide/screens/recipes_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectIndex = 1;
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    GroceryScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(
          title:
              Text('Fooderlich', style: Theme.of(context).textTheme.headline6),
        ),
        body: pages[tabManager.selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabManager.selectedTab,
          onTap: (index) {
            tabManager.goToTab(index);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                title: Text("Explore"), icon: Icon(Icons.explore)),
            BottomNavigationBarItem(
                title: Text("Recipes"), icon: Icon(Icons.book)),
            BottomNavigationBarItem(
                title: Text("To Buy"), icon: Icon(Icons.list))
          ],
        ),
      );
    });
  }
}
