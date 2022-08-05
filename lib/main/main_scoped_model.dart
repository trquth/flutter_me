import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(App());

class Car {
  String _name;
  String _model;
  String _image;
  Car(this._name, this._model, this._image);
  operator ==(other) {
    if (other == null) return false;
    return (other is Car) && (_name == other._name) && (_model == other._model);
  }
}

class CarsListModel extends Model {
  List<Car> _carList = [
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

  List<Car> get carsList => _carList;

  void add(String name, String model, String image) {
    _carList.add(Car(name, model, image));
    notifyListeners();
  }
}

class CarSelectionModel extends Model {
  Car? _selectedCar;
  Car? get selectedCar => _selectedCar;
  set selectedCar(Car? selectedCar) {
    _selectedCar = selectedCar;
    notifyListeners();
  }

  bool isSelected(Car car) {
    if (_selectedCar == null) {
      return false;
    } else {
      return car == _selectedCar;
    }
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScopedModel<CarsListModel>(
          model: CarsListModel(),
          child: ScopedModel<CarSelectionModel>(
            model: CarSelectionModel(),
            child: Home(),
          )),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  _addCar(BuildContext context) {
    ScopedModel.of<CarsListModel>(context, rebuildOnChange: true).add(
        "Subaru",
        "WRX",
        "https://media.ed.edmunds-media.com/subaru/wrx/2018/oem/2018_subaru_wrx_sedan_sti-limited_s_oem_1_150.jpg");
  }

  String _calculateSelectedCarName(BuildContext context) {
    Car? selectedCar =
        ScopedModel.of<CarSelectionModel>(context, rebuildOnChange: true)
            .selectedCar;
    if (selectedCar == null) {
      return "No car selected.";
    } else {
      return "Selected: ${selectedCar._model} ${selectedCar._name}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final carList =
        ScopedModel.of<CarsListModel>(context, rebuildOnChange: true).carsList;

    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      body: ListView(
        children: carList.map((e) => CarWidget(e)).toList(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
      persistentFooterButtons: [
        Text(_calculateSelectedCarName(context)),
        IconButton(
            onPressed: () {
              _addCar(context);
            },
            icon: Icon(Icons.add))
      ],
    );
  }
}

class CarWidget extends StatelessWidget {
  CarWidget(this._car) : super();
  final Car _car;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CarSelectionModel>(
      builder: (context, child, model) {
        return GestureDetector(
          onTap: () {
            model.selectedCar = _car;
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(),
                color: model.isSelected(_car) ? Colors.blue : Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    '${_car._name} ${_car._model}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.network(_car._image),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
