import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/app/fooder/my_authcard.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(width: 350, height: 450),
      margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/fooder/mag5.png"), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10.0)),
      child: Stack(
        children: [
          const AuthCard(),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                bottom: 70,
                left: 16,
                child: RotatedBox(
                  quarterTurns: 45,
                  child: Text(
                    "Smoothies",
                    style: ThemeData.light().textTheme.headline2,
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: Text(
                  "Recipe",
                  style: ThemeData.light().textTheme.headline2,
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
