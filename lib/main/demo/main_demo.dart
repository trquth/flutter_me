import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {"/about": (BuildContext context) => About()},
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _data = "...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigtor'),
        actions: [
          IconButton(
              onPressed: () async {
                final String _response = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) {
                        return SongList(
                          radioGroupValue: 0,
                        );
                      },
                    ));
                debugPrint("xxxxxx--->" + _response);
                _data = _response;
              },
              icon: Icon(Icons.info_outline))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Text(
              "Data 🌻🌻🌻🌻 $_data",
              style: TextStyle(fontSize: 32),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sentiment_satisfied),
        tooltip: "About",
        onPressed: () {
          Navigator.pushNamed(context, "/about");
        },
      ),
    );
  }
}

class SongList extends StatefulWidget {
  final int radioGroupValue;
  SongList({Key? key, required this.radioGroupValue}) : super(key: key);

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  List<String> _songList = [];
  late String _selectedSong;
  late int _radioGroupValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _songList
      ..add("Con co be be")
      ..add("Baby Shark");
    _radioGroupValue = widget.radioGroupValue;
  }

  void _radioOnChanged(int? index) {
    setState(() {
      _radioGroupValue = index!;
      _selectedSong = _songList[index];
      debugPrint("_selectedSong $_selectedSong");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Song"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context, _selectedSong);
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: SafeArea(
        child: Row(
          children: [
            Radio(
              value: 0,
              groupValue: _radioGroupValue,
              onChanged: _radioOnChanged,
            ),
            Text("Con co be be"),
            Radio(
              value: 1,
              groupValue: _radioGroupValue,
              onChanged: _radioOnChanged,
            ),
            Text("Baby Shark")
          ],
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
    );
  }
}
