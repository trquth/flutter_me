import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingImagePage(),
    );
  }
}

class LoadingImagePage extends StatelessWidget {
  const LoadingImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeInImage.assetNetwork(
            placeholder: 'assets/loading.gif',
            image:
                'http://archivision.com/educational/samples/files/1A2-F-P-I-2-C1_L.jpg'),
      ),
    );
  }
}
