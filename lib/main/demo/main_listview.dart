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

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 120,
      child: Card(
        elevation: 8.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Barista",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: Colors.orange),
            ),
            Text(
              "Travel Plan",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, int index) {
    return Card(
      child: ListTile(
        title: Text("Airplane #$index"),
        subtitle: Text("Very Cool"),
        leading: Icon(
          Icons.flight,
          size: 48.0,
          color: Colors.lightBlue,
        ),
        trailing: Text(
          '${index * 7}',
          style: TextStyle(color: Colors.lightBlue),
        ),
        onTap: () {
          debugPrint("Tapped on Row $index");
        },
      ),
    );
  }

  Widget _buildFooter(BuildContext context, int index) {
    return ListTile(
        leading:
            Icon(Icons.directions_car, size: 48.0, color: Colors.lightGreen),
        title: Text("Car $index"),
        subtitle: Text("Very Cool"),
        trailing: (index % 3).isEven
            ? Icon(Icons.bookmark_border)
            : Icon(Icons.bookmark),
        onTap: () {
          debugPrint("Tapped on row $index");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildHeader(context);
            } else if (index >= 1 && index <= 3) {
              return _buildBody(context, index);
            } else {
              return _buildFooter(context, index);
            }
          },
        ),
      ),
    );
  }
}
