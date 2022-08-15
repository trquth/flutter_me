import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/app/fooder/customize_card1.dart';
import 'package:flutter_complete_guide/app/fooder/fooder_explore_screen.dart';
import 'package:flutter_complete_guide/app/fooder/my_card1.dart';
import 'package:flutter_complete_guide/app/fooder/my_card2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    //const CustomizeCard1(),
    //const Card2(),
    FooderExploreScreen(),
    Container(
      color: Colors.blue,
    )
  ];

  void _onSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fooder"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting")
        ],
        currentIndex: _selectedIndex,
        onTap: _onSelectedIndex,
      ),
      body: pages[_selectedIndex],
    );
  }
}
