import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            "Hello world 2",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
