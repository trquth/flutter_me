import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/components/recipe_thumbnail.dart';
import 'package:flutter_complete_guide/models/simple_recipe.dart';

class RecipesGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;
  const RecipesGridView({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final data = recipes[index];
            return RecipteThumbnail(recipe: data);
          }),
    );
  }
}
