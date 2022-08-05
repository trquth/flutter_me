import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/theme.dart';

class Card3 extends StatelessWidget {
  const Card3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/mag2.png"), fit: BoxFit.fill),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.book,
                  size: 40,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Recipe Trends',
                  style: ThemeX.darkTextTheme.headline2,
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 12,
                    children: [
                      Chip(
                        label: Text(
                          'Healthy',
                          style: ThemeX.darkTextTheme.bodyText1,
                        ),
                        backgroundColor: Colors.black.withOpacity(0.7),
                        onDeleted: () {},
                      ),
                      Chip(
                        label: Text(
                          'Vegan',
                          style: ThemeX.darkTextTheme.bodyText1,
                        ),
                        backgroundColor: Colors.black.withOpacity(0.7),
                        onDeleted: () {},
                      ),
                      Chip(
                        label: Text(
                          'Carrots',
                          style: ThemeX.darkTextTheme.bodyText1,
                        ),
                        backgroundColor: Colors.black.withOpacity(0.7),
                        onDeleted: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
