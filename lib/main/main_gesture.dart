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
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String log = "";

  void clear() {
    setState(() {
      log = "";
    });
  }

  void logGesture(String logText) {
    setState(() {
      log += "\n";
      log += logText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Text("Gesture Me!!!"),
              onTap: () {
                logGesture("onTap");
              },
              onTapDown: (details) {
                logGesture('onTapDown $details');
              },
            ),
            Container(
              child: SingleChildScrollView(
                child: Text('$log'),
              ),
              constraints: BoxConstraints(maxHeight: 200, minWidth: 300),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
            ),
            ElevatedButton(
                onPressed: () {
                  clear();
                },
                child: Text("Clear"))
          ],
        ),
      ),
    );
  }
}
