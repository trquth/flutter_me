import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),
          // color: Colors.lightBlue,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(20)),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  color: Colors.orange,
                  width: 160,
                ),
                Container(
                  color: Colors.blue,
                  width: 160,
                ),
                Container(
                  color: Colors.green,
                  width: 160,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
