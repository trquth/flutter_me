import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RawMaterialButton redBtn = RawMaterialButton(
      onPressed: () {},
      fillColor: Colors.red,
    );

    RawMaterialButton greenBtn = RawMaterialButton(
      onPressed: () {},
      fillColor: Colors.green,
    );

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Expanded(child: redBtn), Expanded(child: greenBtn)]),
        ),
      ),
    );
  }
}
