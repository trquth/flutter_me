import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/sections/provider/provider_practice_screen.dart';
import 'package:flutter_complete_guide/sections/provider/providers/changing_content.dart';
import 'package:flutter_complete_guide/sections/provider/providers/counting_the_number.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData.light();
    return MaterialApp(
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CountingTheNumber(),
          ),
          ChangeNotifierProvider(
            create: (context) => ChangingContent(),
          )
        ],
        child: const ProviderPracticeScreen(),
      ),
    );
  }
}
