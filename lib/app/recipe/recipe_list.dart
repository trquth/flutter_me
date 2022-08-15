import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/app/recipe/recipe.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Widget buildCard(Recipe recipe) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image(image: AssetImage(recipe.imgUrl)),
            const SizedBox(
              height: 14,
            ),
            Text(
              recipe.label,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Palatino'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
            child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Text("Test");
                  },
                ))
              },
              child: buildCard(Recipe.samples[index]),
            );
          },
        )));
  }
}
