import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  Container topContainer = Container(
    child: Text("Top Container"),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        color: Colors.green),
    padding: EdgeInsets.all(10),
  );
  Container bottomColor = Container(
    child: Text("Bottom Container"),
    decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(color: Colors.black, width: 1.0)),
    padding: EdgeInsets.all(10),
  );

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpandedTop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isExpandedTop = !isExpandedTop;
                });
              },
              icon: Icon(Icons.rotate_left_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isExpandedTop
                ? Expanded(child: widget.topContainer)
                : widget.topContainer,
            !isExpandedTop
                ? Expanded(child: widget.bottomColor)
                : widget.bottomColor,
          ],
        ),
      ),
    );
  }
}
