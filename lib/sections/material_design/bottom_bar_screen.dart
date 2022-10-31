import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/bottom-bar';
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgets = [
    Text(
      'Page 1',
      style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
    ),
    Text(
      'Page 2',
      style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
    ),
    Text(
      'Page 3',
      style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
    ),
    Text(
      'Page 4',
      style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
    ),
    Text(
      'Page 5',
      style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
    )
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Bar')),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        elevation: 5,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.security), label: 'First Screen'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book), label: 'Second Screen')
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
      body: Center(
        child: _widgets[_selectedIndex],
      ),
    );
  }
}
