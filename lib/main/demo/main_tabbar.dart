import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: SafeArea(
        child: TabBarView(controller: _tabController, children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          )
        ]),
      ),
      bottomNavigationBar: SafeArea(
        child:
            TabBar(controller: _tabController, labelColor: Colors.black, tabs: [
          Tab(
            icon: Icon(Icons.home),
            text: "Tab 1",
          ),
          Tab(
            icon: Icon(Icons.store),
            text: "Tab 2",
          ),
          Tab(
            icon: Icon(Icons.account_balance),
            text: "Tab 3",
          )
        ]),
      ),
    );
  }
}
