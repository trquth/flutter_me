import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/models.dart';

class RecipteThumbnail extends StatelessWidget {
  final SimpleRecipe recipe;
  const RecipteThumbnail({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ClipRRect(
                  child: Image.asset(
                    '${recipe.dishImage}',
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12))),
          const SizedBox(
            height: 10,
          ),
          Text(
            recipe.title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            recipe.duration,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
