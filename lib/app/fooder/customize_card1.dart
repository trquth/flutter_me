import 'package:flutter/material.dart';

class CustomizeCard1 extends StatelessWidget {
  const CustomizeCard1({Key? key}) : super(key: key);

  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(width: 350, height: 450),
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      padding: EdgeInsets.all(16),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/fooder/mag1.png"), fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Stack(
        children: [
          Text(
            category,
            style: ThemeData.dark().textTheme.bodyText1,
          ),
          Positioned(
            child: Text(
              title,
              style: ThemeData.dark().textTheme.headline2,
            ),
            top: 20,
          ),
          Positioned(
            child: Text(
              description,
              style: ThemeData.dark().textTheme.bodyText1,
            ),
            bottom: 30,
            right: 0,
          ),
          Positioned(
            child: Text(
              chef,
              style: ThemeData.dark().textTheme.bodyText1,
            ),
            bottom: 10,
            right: 0,
          )
        ],
      ),
    );
  }
}
