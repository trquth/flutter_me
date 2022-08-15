import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/app/fooder/my_card1.dart';

class TodayRecipeListView extends StatelessWidget {
  const TodayRecipeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipes of the Day 🍳',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 400,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return MyCard1();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemCount: 1),
          )
        ],
      ),
    );
  }
}
