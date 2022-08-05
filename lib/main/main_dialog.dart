import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
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

class _HomePageState extends State<HomePage> {
  int counter = 0;

  Future<bool> showConfirmDialog() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirm"),
            content: Text("Are you sure you want to increment the 'counter'?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text("No"))
            ],
          );
        });
  }

  void increaseCounter() {
    showConfirmDialog().then((result) {
      debugPrint("$result");
      if (result == true) {
        setState(() {
          counter++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button many times:"),
            Text("$counter")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increaseCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
