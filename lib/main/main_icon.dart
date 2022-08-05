import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Row row1 = Row(
      children: [Icon(Icons.add), Text("24")],
    );
    Row row2 = Row(
      children: [
        Icon(
          Icons.ac_unit,
          size: 48,
        ),
        Text('48')
      ],
    );

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [row1, row2],
          ),
        ),
      ),
    );
  }
}
