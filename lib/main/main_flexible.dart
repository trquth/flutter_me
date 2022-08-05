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

  Container topWidget = Container(
    child: Text("Top Widget"),
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        color: Colors.orange),
    padding: EdgeInsets.all(20),
    constraints: BoxConstraints(
        minHeight: 100, minWidth: 100, maxHeight: 200, maxWidth: 200),
  );

  Container bottomWidget = Container(
    child: Text("Bottom Widget"),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1), color: Colors.green),
    padding: EdgeInsets.all(20),
    constraints: BoxConstraints(
        minHeight: 100, minWidth: 100, maxHeight: 200, maxWidth: 100),
  );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool topTightFit = false;
  bool bottomExpanded = false;

  toggleTop() {
    setState(() {
      topTightFit = !topTightFit;
    });
  }

  toggleBottom() {
    setState(() {
      bottomExpanded = !bottomExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    String toolbarTextTop = "Top (" + (topTightFit ? "tight" : "loose") + ")";
    String toolbarTextBottom =
        "Bottom (" + (bottomExpanded ? "expanded" : "not expanded") + ")";
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
        actions: [
          FlatButton.icon(
              icon: Icon(topTightFit
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
              label: Text(toolbarTextTop),
              onPressed: () => toggleTop()),
          FlatButton.icon(
              icon: Icon(bottomExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
              label: Text(toolbarTextBottom),
              onPressed: () => toggleBottom())
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: widget.topWidget,
                fit: topTightFit ? FlexFit.tight : FlexFit.loose),
            bottomExpanded
                ? Expanded(child: widget.bottomWidget)
                : widget.bottomWidget
          ],
        ),
      ),
    );
  }
}
