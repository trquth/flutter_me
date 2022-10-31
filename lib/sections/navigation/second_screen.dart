import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  static const routeName = '/second-screen';
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final images = arguments['data'] as List;

    return Scaffold(
      appBar: AppBar(title: const Text('Second')),
      body: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          children: images
              .map((url) => Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                            image: NetworkImage(url), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  ))
              .toList()),
    );
  }
}
