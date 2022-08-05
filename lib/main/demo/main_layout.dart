import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/main/main_horizontal_list.dart';

void main(List<String> args) {
  return runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Layout",
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        brightness: Brightness.dark,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.cloud_queue))],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            _buildBannerHeader(context),
            SafeArea(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEntry(context),
                  Divider(),
                  _buildWeather(context),
                  Divider(),
                  _buildTags(context),
                  Divider(),
                  _buildFooter(context)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildBannerHeader(BuildContext context) {
    return Image(
      image: AssetImage("assets/present.jpg"),
      fit: BoxFit.cover,
    );
  }

  Widget _buildEntry(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Birthday",
          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        ),
        Divider(),
        Text(
          'It’s going to be a great birthday. We are going out for dinner at my favorite place, then watch a movie after we go to the gelateria for ice cream and espresso.',
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ],
    );
  }

  Widget _buildWeather(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.wb_sunny,
          color: Colors.orange,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "81° Clear",
                  style: TextStyle(color: Colors.deepOrange),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "4500 San Alpho Drive, Dallas, TX United States",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _buildTags(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: List.generate(
          7,
          (index) => Chip(
                avatar: Icon(Icons.card_giftcard),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: BorderSide(color: Colors.grey)),
                label: Text(
                  "Gift ${index + 1}",
                  style: TextStyle(fontSize: 10.0),
                ),
                backgroundColor: Colors.grey.shade100,
              )),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/salmon.jpg'),
          radius: 40.0,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/asparagus.jpg'),
          radius: 40.0,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/strawberries.jpg'),
          radius: 40.0,
        ),
        Container(
          child: SizedBox(
            width: 80.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.cake),
                Icon(Icons.star_border),
                Icon(Icons.music_note)
              ],
            ),
          ),
        )
      ],
    );
  }
}
