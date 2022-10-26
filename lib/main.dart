import 'package:flutter/material.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = ThemeData();
    final ThemeData theme = ThemeData.light();
    return MaterialApp(
      theme: theme,
      home: Container(
        color: Colors.white,
      ),
    );
  }
}
