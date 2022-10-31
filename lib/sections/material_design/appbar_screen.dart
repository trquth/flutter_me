import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarScreen extends StatelessWidget {
  static const routeName = '/app_bar';
  const AppBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Surprise!!!!')));
            },
            icon: const Icon(Icons.add_alert),
            tooltip: 'Add More',
          )
        ],
      ),
    );
  }
}
