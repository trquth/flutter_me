import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double top = 0;
  double left = 0;
  List<Widget> widgetList = [];

  final random = Random();

  int next(int min, int max) => min + random.nextInt(max - min);

  void addLayer() {
    setState(() {
      widgetList.add(Positioned(
          left: left,
          top: top,
          child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
                color: Color.fromRGBO(
                    next(0, 255), next(0, 255), next(0, 255), 0.5),
              ))));
    });
    top += 30;
    left += 30;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: widgetList,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addLayer();
        },
      ),
    );
  }
}
