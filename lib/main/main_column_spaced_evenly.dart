import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RawMaterialButton redBtn = RawMaterialButton(
      onPressed: () {},
      constraints: BoxConstraints(minHeight: 136, minWidth: 188),
      shape: CircleBorder(),
      elevation: 2,
      fillColor: Colors.red,
      padding: EdgeInsets.all(15),
    );

    RawMaterialButton greenBtn = RawMaterialButton(
      onPressed: () {},
      constraints: BoxConstraints(minHeight: 136, minWidth: 188),
      shape: CircleBorder(),
      elevation: 2,
      fillColor: Colors.green,
      padding: EdgeInsets.all(15),
    );
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [redBtn, greenBtn],
      ),
    ));
  }
}
