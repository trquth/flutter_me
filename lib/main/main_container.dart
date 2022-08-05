import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        title: "Demo",
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title = ""}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
  }

  void spin() {
    _controller?.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Center(
          child: new Container(
              child: new RotationTransition(
                  turns: new AlwaysStoppedAnimation(_animation!.value),
                  child: new Icon(Icons.airplanemode_active, size: 150.0)),
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.redAccent))),
      floatingActionButton: FloatingActionButton(
        onPressed: spin,
        child: Icon(Icons.rotate_right),
      ),
    );
  }
}
