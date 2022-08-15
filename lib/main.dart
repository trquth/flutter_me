import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/app/fooder/fooder.dart';
import 'package:flutter_complete_guide/app/fooder/fooder_theme.dart';
import 'package:flutter_complete_guide/app/recipe/recipe.dart';
import 'package:flutter_complete_guide/app/recipe/recipe_detail.dart';
import 'package:flutter_complete_guide/app/recipe/recipe_list.dart';
import 'package:flutter_complete_guide/app/fooder/home.dart';

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
      //****************Recipe******************
      // title: "Recipe Calculate",
      // theme: theme.copyWith(
      //     colorScheme: theme.colorScheme
      //         .copyWith(primary: Colors.grey, secondary: Colors.black)),
      // home: const MyHomePage(
      //   title: "Recipe Calculator",
      // ),
      // home: RecipeDetail(recipe: Recipe.samples[0]),
      //****************Fooder******************
      theme: theme,
      home: const Home(),
    );
  }
}
