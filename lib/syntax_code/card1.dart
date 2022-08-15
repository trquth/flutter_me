import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/syntax_code/theme.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  final String category = "Editors\'s Choise";
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/mag1.png'), fit: BoxFit.fill),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Stack(
          children: [
            Text(
              category,
              style: ThemeX.darkTextTheme.headline5,
            ),
            Positioned(
              child: Text(
                title,
                style: ThemeX.darkTextTheme.bodyText1,
              ),
              top: 20,
            ),
            Positioned(
              child: Text(
                description,
                style: ThemeX.darkTextTheme.bodyText1,
              ),
              bottom: 30,
              right: 0,
            ),
            Positioned(
              child: Text(
                chef,
                style: ThemeX.darkTextTheme.bodyText1,
              ),
              bottom: 15,
              right: 0,
            ),
          ],
        ),
      ),
    );
  }
}
