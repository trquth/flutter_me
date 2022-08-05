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
  static const double TWENTY = 20;
  static const List<String> titles = [
    "all 20.0",
    "left 20.0",
    "right 20.0",
    "top 20.0",
    "bottom 20.0",
    "sym horiz 20.0",
    "sym vert 20.0"
  ];

  static const List<EdgeInsets> edgeInsets = [
    const EdgeInsets.all(TWENTY),
    const EdgeInsets.only(left: TWENTY),
    const EdgeInsets.only(right: TWENTY),
    const EdgeInsets.only(top: TWENTY),
    const EdgeInsets.only(bottom: TWENTY),
    const EdgeInsets.symmetric(horizontal: TWENTY),
    const EdgeInsets.symmetric(vertical: TWENTY)
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titles[index]),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    index++;
                    if (index >= edgeInsets.length) {
                      index = 0;
                    }
                  });
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: Padding(
          padding: edgeInsets[index],
          child: Container(color: Colors.orange),
        ));
  }
}
