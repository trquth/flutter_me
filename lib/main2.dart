import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/color.dart';
import 'package:flutter_complete_guide/colorbutton.dart';
import 'package:flutter_complete_guide/home.dart';
import 'package:flutter_complete_guide/models/models.dart';
import 'package:flutter_complete_guide/theme.dart';
import 'package:provider/provider.dart';

// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _colorIndex = 0;
  final colors = const [
    {
      "color": "Black?",
      "range": [
        "Black1",
        "Black2",
        "Black3",
      ]
    }
  ];

  void _onSelectColor() {
    if (_colorIndex < colors.length) {
      setState(() {
        _colorIndex += 1;
      });
    }

    print(_colorIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeX.dark(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TabManager(),
          )
        ],
        child: const Home(),
      ),
    );
    final theme = ThemeX.dark();
    return MaterialApp(
        title: "Demo",
        theme: theme,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Demo 2',
              style: theme.textTheme.headline3,
            ),
          ),
          body: Center(
            child: Text('App content'),
          ),
        ));
    // return MaterialApp(
    //     home: Scaffold(
    //   appBar: AppBar(
    //     title: Text('My App'),
    //   ),
    //   body: false
    //       ? Column(
    //           children: [
    //             Color(colors[0]["color"] as String),
    //             ...(colors[0]["range"] as List<String>).map((color) {
    //               return ColorButton(_onSelectColor, color);
    //             }).toList()
    //           ],
    //         )
    //       : Center(
    //           child: Text('Center content'),
    //         ),
    // ));
  }
}
