import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo",
      home: HomePage(),
    );
  }
}

class Car {
  String make;
  String model;
  String imageSrc;

  Car(this.make, this.model, this.imageSrc);

  operator ==(other) =>
      (other is Car) && (make == other.make) && (model == other.model);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState("Cars");
}

class _HomePageState extends State<HomePage> {
  String title;
  List<Car> _cars = [];
  Car? selectedCar;

  _HomePageState(this.title) {
    _cars = [
      Car(
        "Bmw",
        "M3",
        "https://media.ed.edmunds-media.com/bmw/m3/2018/oem/2018_bmw_m3_sedan_base_fq_oem_4_150.jpg",
      ),
      Car(
        "Nissan",
        "GTR",
        "https://media.ed.edmunds-media.com/nissan/gt-r/2018/oem/2018_nissan_gt-r_coupe_nismo_fq_oem_1_150.jpg",
      ),
      Car(
        "Nissan",
        "Sentra",
        "https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg",
      )
    ];
  }

  void selectionHandler(Car sCar) {
    setState(() {
      title = 'Selected ${sCar.make} ${sCar.model}';
      this.selectedCar = sCar;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<CarWidget> carWidgets = _cars.map((Car car) {
      return CarWidget(car, car == this.selectedCar, selectionHandler);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView(
        children: carWidgets,
      ),
    );
  }
}

class CarWidget extends StatelessWidget {
  const CarWidget(this.car, this.isSelected, this.parentSelectionHandler)
      : super();

  final Car car;
  final bool isSelected;
  final ValueChanged<Car> parentSelectionHandler;

  void handleTap() {
    parentSelectionHandler(car);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: GestureDetector(
          onTap: handleTap,
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: isSelected ? Colors.lightBlueAccent : Colors.white),
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Text("${car.make}  ${car.model}"),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.network(car.imageSrc),
                    )
                  ],
                ),
              ))),
    );
  }
}
