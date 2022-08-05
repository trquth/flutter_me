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

class Trip {
  String id;
  String tripName;
  String location;

  Trip({required this.id, required this.tripName, required this.location});
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _trips = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _trips
      ..add(Trip(id: '0', tripName: 'Rome', location: 'Italy'))
      ..add(Trip(id: '1', tripName: 'Paris', location: 'France'))
      ..add(Trip(id: '2', tripName: 'New York', location: 'USA - New York'))
      ..add(Trip(id: '3', tripName: 'Cancun', location: 'Mexico'))
      ..add(Trip(id: '4', tripName: 'London', location: 'England'))
      ..add(Trip(id: '5', tripName: 'Sydney', location: 'Australia'))
      ..add(Trip(id: '6', tripName: 'Miami', location: 'USA - Florida'))
      ..add(Trip(id: '7', tripName: 'Rio de Janeiro', location: 'Brazil'))
      ..add(Trip(id: '8', tripName: 'Cusco', location: 'Peru'))
      ..add(Trip(id: '9', tripName: 'New Delhi', location: 'India'))
      ..add(Trip(id: '10', tripName: 'Tokyo', location: 'Japan'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
      ),
      body: ListView.builder(
        itemCount: _trips.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_trips[index].id),
            child: _buildTitle(context, index),
            background: _buildCompleteTrip(context),
            secondaryBackground: _buildRemoveTrip(context),
            onDismissed: (direction) {
              debugPrint('$direction');
              direction == DismissDirection.startToEnd
                  ? debugPrint("complete trip")
                  : debugPrint("remove a trip");
              setState(() {
                _trips.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildTitle(BuildContext context, int index) {
    Trip trip = _trips[index];
    return ListTile(
      title: Text('${trip.tripName}'),
      subtitle: Text(trip.location),
      leading: Icon(Icons.flight),
      trailing: Icon(Icons.fastfood),
    );
  }

  Widget _buildCompleteTrip(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.done,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRemoveTrip(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Icon(Icons.delete, color: Colors.white)],
        ),
      ),
    );
  }
}
