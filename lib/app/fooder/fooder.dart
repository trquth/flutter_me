import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/app/fooder/fooder_theme.dart';

class Fooder extends StatelessWidget {
  const Fooder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FOODER",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Center(
        child: Text(
          'Test',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
