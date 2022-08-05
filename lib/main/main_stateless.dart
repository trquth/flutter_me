import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Practice Code",
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Demo'),
      ),
      body: ListView(
        children: [
          CarWidget("Bmw", "M3",
              "https://media.ed.edmunds-media.com/bmw/m3/2018/oem/2018_bmw_m3_sedan_base_fq_oem_4_150.jpg"),
          CarWidget("Nissan", "GTR",
              "https://media.ed.edmunds-media.com/nissan/gt-r/2018/oem/2018_nissan_gt-r_coupe_nismo_fq_oem_1_150.jpg"),
          CarWidget("Nissan", "Sentra",
              "https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg"),
        ],
      ),
    );
  }
}

class CarWidget extends StatelessWidget {
  final String make;
  final String model;
  final String imageSrc;

  const CarWidget(this.make, this.model, this.imageSrc) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        padding: EdgeInsets.all(20),
        child: Center(
            child: Column(
          children: [
            Text(
              '${make} ${model}',
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Image.network(imageSrc),
            )
          ],
        )),
      ),
    );
  }
}
