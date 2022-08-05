import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextInPage(),
    );
  }
}

class TextBlock {
  final Color _color;
  final String _text;
  TextBlock(this._color, this._text);

  String get text => _text;
  Color get color => _color;
}

class TextInPage extends StatefulWidget {
  const TextInPage({Key? key}) : super(key: key);

  @override
  State<TextInPage> createState() => _TextInPageState();
}

class _TextInPageState extends State<TextInPage> {
  int index = 0;
  List<TextBlock> textBlocks = [
    TextBlock(Colors.red, 'every'),
    TextBlock(Colors.redAccent, ' schoolboy'),
    TextBlock(Colors.green, '\nknows'),
    TextBlock(Colors.greenAccent, ' who'),
    TextBlock(Colors.blue, '\nimprisoned'),
    TextBlock(Colors.blueAccent, '\nMontezuma')
  ];

  void incrementCounter() {
    setState(() {
      if (index < textBlocks.length) {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<TextSpan> textSpans = [];

    for (var i = 0; i < index; i++) {
      TextBlock textBlock = textBlocks[i];
      textSpans.add(TextSpan(
          text: textBlock.text, style: TextStyle(color: textBlock.color)));
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text.rich(TextSpan(children: textSpans))],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: "Increment",
        child: Icon(Icons.add),
      ),
    );
  }
}
