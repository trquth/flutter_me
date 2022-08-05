import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  final PleaseWaitWidget _pleaseWaitWidget = PleaseWaitWidget(
    key: ObjectKey('pleaseWaitWidget'),
  );
  final AppWidget _appWidget = AppWidget(
    key: ObjectKey('appWidget'),
  );

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool pleaseWait = false;
  @override
  Widget build(BuildContext context) {
    List<Widget> childWidgets = pleaseWait
        ? [widget._pleaseWaitWidget, widget._appWidget]
        : [widget._appWidget];
    return Scaffold(
      body: Container(
        child: Stack(
          key: ObjectKey('stack'),
          children: childWidgets,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            pleaseWait = !pleaseWait;
          });
        },
        label: Text('Please Wait On/Off'),
        icon: Icon(Icons.cached),
      ),
    );
  }
}

class PleaseWaitWidget extends StatelessWidget {
  const PleaseWaitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 8.0,
          ),
        ),
        color: Colors.grey.withOpacity(0.3));
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Your",
          style: TextStyle(fontSize: 20.0),
        ),
        Text(
          "App",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Goes",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Here",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
