import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVertical = false;
  int index = 0;
  List<MainAxisAlignment> alignments = [
    MainAxisAlignment.start,
    MainAxisAlignment.end,
    MainAxisAlignment.center,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceEvenly,
    MainAxisAlignment.spaceAround
  ];
  List<String> alignmentTexts = [
    "Start",
    "End",
    "Center",
    "Soace Between",
    "Space Evenly",
    "Space Around"
  ];

  RawMaterialButton redBtn = RawMaterialButton(
    onPressed: () {},
    fillColor: Colors.red,
  );

  RawMaterialButton blueBtn = RawMaterialButton(
    onPressed: () {},
    fillColor: Colors.blue,
  );

  RawMaterialButton yellowBtn = RawMaterialButton(
    onPressed: () {},
    fillColor: Colors.yellow,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isVertical = !isVertical;
                });
              },
              icon: Icon(Icons.rotate_right)),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(isVertical ? "Vertical" : "Horizontal"),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  index++;
                  if (index >= alignments.length) {
                    index = 0;
                  }
                });
              },
              icon: Icon(Icons.aspect_ratio)),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(alignmentTexts[index]),
          )
        ],
      ),
      body: Flex(
          direction: isVertical ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: alignments[index],
          children: [redBtn, yellowBtn, blueBtn]),
    );
  }
}
