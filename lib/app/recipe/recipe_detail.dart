import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/app/recipe/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: 300,
                width: double.infinity,
                child: Image(image: AssetImage(widget.recipe.imgUrl))),
            const SizedBox(
              height: 4,
            ),
            Text(widget.recipe.label, style: const TextStyle(fontSize: 14)),
            Expanded(
                child: ListView.builder(
              itemCount: widget.recipe.ingredients.length,
              itemBuilder: (context, index) {
                final ingredient = widget.recipe.ingredients[index];
                return Text(
                    '${ingredient.quantity * _sliderVal} - ${ingredient.measure}  - ${ingredient.name}');
              },
            )),
            Slider(
              min: 1,
              max: 10,
              value: _sliderVal.toDouble(),
              label: '${_sliderVal * widget.recipe.servings} servings',
              onChanged: (value) {
                print('Slider value ${value}');
                setState(() {
                  _sliderVal = value.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
