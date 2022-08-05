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

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Tab2 extends StatelessWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Tab3 extends StatelessWidget {
  const Tab3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title = ""}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: TabBarView(children: [Tab1(), Tab2(), Tab3()]),
          bottomNavigationBar: Container(
            child: TabBar(labelColor: Colors.blue,unselectedLabelColor: Colors.red, tabs: [
              Tab(
                text: "Tab #1",
                icon: Icon(Icons.home),
              ),
              Tab(
                text: "Tab #2",
                icon: Icon(Icons.gamepad),
              ),
              Tab(
                text: "Tab #3",
                icon: Icon(Icons.unarchive,
              )
            ])],
          ),
        ));
  }
}
