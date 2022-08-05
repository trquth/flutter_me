import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: MovieTitlePage(),
      routes: {
        "/": (context) => MovieTitlePage(),
        "/detail": (context) => DetailPage()
      },
    );
  }
}

class MovieTitlePage extends StatefulWidget {
  const MovieTitlePage({Key? key}) : super(key: key);

  @override
  _MovieTitlePageState createState() => _MovieTitlePageState();
}

class _MovieTitlePageState extends State<MovieTitlePage> {
  TextEditingController controller = TextEditingController();
  goToNextPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(),
            settings: RouteSettings(arguments: controller.text)));
    // Navigator.pushNamed(context, "/detail");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Title"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Page 1',
                textScaleFactor: 1.5,
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(labelText: "Movie Name"),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 100,
                  child: buildTitlePageCore(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: goToNextPage, child: Text("Next Page"))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitlePageCore() {
    return ListView.builder(
      itemCount: 25,
      itemBuilder: (context, index) => ListTile(
        title: Text('Rocky ${index + 1}'),
        onTap: () => {},
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  final overview = '(From themoviedb.com) One day at work, unsuccessful '
      'puppeteer Craig finds a portal into the head of actor John '
      'Malkovich. The portal soon becomes a passion for anybody who '
      'enters its mad and controlling world of overtaking another human '
      'body.';

  Future<String> updateOverview(
      {required String api_key, required String movieTitle}) async {
    final response = await get(Uri(
        path: 'https://api.themoviedb.org/3/search/movie?api_key='
            '$api_key&query="$movieTitle"'));
    return json.decode(response.body)["result"][0]["overview"];
  }

  Future<String> getMovieData(String movieTitle) {
    return updateOverview(
        api_key: "cc04d296c0432d6ca06ae3c4bdbd8e80", movieTitle: movieTitle);
  }

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Text(
            overview,
            textScaleFactor: 1.5,
          ),
          SizedBox(height: 30),
          Text("My name is ${routeArg}"),
          IconButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              icon: Icon(Icons.arrow_back)),
          FutureBuilder(
            future: getMovieData("Iron man"),
            builder: (context, snapshot) {
              debugPrint("${snapshot}");
              if (snapshot.hasData) {
                return Text("${snapshot.data}");
              }
              return CircularProgressIndicator();
            },
          )
        ]),
      ),
    );
  }
}
