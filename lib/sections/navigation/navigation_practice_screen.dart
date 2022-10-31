import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_complete_guide/sections/navigation/first_screen.dart';
import 'package:flutter_complete_guide/sections/navigation/second_screen.dart';

class NavigationPracticeScreen extends StatelessWidget {
  const NavigationPracticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FirstScreen(),
      initialRoute: '/second',
      onGenerateRoute: (settings) {
        if (settings.name != '/second') {
          return null;
        }
        return MaterialPageRoute(
            builder: (context) {
              return const SecondScreen();
            },
            settings: settings,
            fullscreenDialog: true);
      },
    );
  }
}
