import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  late Widget currentPage;
  List _listPages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listPages
      ..add(Container(
        color: Colors.white,
        child: Center(
          child: Icon(
            Icons.cake,
            size: 120,
            color: Colors.red,
          ),
        ),
      ))
      ..add(Container(
        child: Center(
          child: Icon(
            Icons.sentiment_satisfied,
            size: 120,
            color: Colors.yellow,
          ),
        ),
      ))
      ..add(Container(
        child: Center(
          child: Icon(Icons.access_alarm, size: 120, color: Colors.green),
        ),
      ));
    currentPage = _listPages[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: currentPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: "A"),
          BottomNavigationBarItem(
              icon: Icon(Icons.sentiment_satisfied), label: "B"),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: "C")
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            currentPage = _listPages[index];
          });
        },
      ),
    );
  }
}
