import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/components/friend_post_tile.dart';
import 'package:flutter_complete_guide/models/models.dart';
import 'package:flutter_complete_guide/syntax_code/card1.dart';
import 'package:flutter_complete_guide/syntax_code/card2.dart';
import 'package:flutter_complete_guide/syntax_code/card3.dart';

class TodayRecipeListView extends StatelessWidget {
  final List<ExploreRecipe> recipes;
  const TodayRecipeListView({Key? key, required this.recipes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        children: [
          Text(
            'Recipes of the Day 🌻',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 400,
            color: Colors.transparent,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return buildCard(recipe);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 16,
                  );
                },
                itemCount: recipes.length),
          ),
        ],
      ),
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1();
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2();
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3();
    } else {
      throw Exception('This card doesn\'t exist yet');
    }
  }
}
