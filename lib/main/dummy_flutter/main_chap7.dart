import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

enum Gender { Male, Female, Other }
String show(Gender gender) => gender.toString().replaceAll("Gender.", "");

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _status = false;
  double _age = 1;
  Gender? _genderValue;
  TextEditingController _nameFieldCtrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_nameFieldCtrl = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameFieldCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Widget"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildAgeSwitch(),
            _buildRangeAges(),
            _buildNameTextField(),
            _buildGenderRadio(),
            _buildResultArea()
          ],
        ),
      ),
    );
  }

  Widget _buildAgeSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("On/Off"),
        Switch(
            value: _status,
            onChanged: (bool status) {
              debugPrint("$status");
              setState(() {
                _status = !_status;
              });
            })
      ],
    );
  }

  Widget _buildResultArea() {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              debugPrint("👋👋👋👋👋 $_status");

              debugPrint("$_nameFieldCtrl.text");
            },
            child: Text("Save"),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Status: $_status " " ${_nameFieldCtrl.text}"),
          SizedBox(
            height: 20,
          ),
          Text(_nameFieldCtrl.text),
          Text(_genderValue != null ? show(_genderValue!) : "Nothing yet")
        ],
      ),
    );
  }

  Widget _buildRangeAges() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Age"),
          Slider(
              min: 1,
              max: 150,
              value: _age,
              onChanged: (double age) {
                setState(() {
                  _age = age;
                });
              },
              label: "$_age")
        ],
      ),
    );
  }

  Widget _buildNameTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: TextField(
        decoration: const InputDecoration(
            labelText: "Input Name",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        controller: _nameFieldCtrl,
      ),
    );
  }

  Widget _buildGenderRadio() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text("MALE"),
            Radio(
                value: Gender.Male,
                groupValue: _genderValue,
                onChanged: (Gender? gender) {
                  debugPrint("$gender");
                  setState(() {
                    _genderValue = gender;
                  });
                })
          ],
        ),
        Row(
          children: [
            const Text("FEMALE"),
            Radio(
                value: Gender.Female,
                groupValue: _genderValue,
                onChanged: (Gender? gender) {
                  debugPrint("$gender");
                  setState(() {
                    _genderValue = gender;
                  });
                })
          ],
        ),
        Row(
          children: [
            Text("OTHER"),
            Radio(
                value: Gender.Other,
                groupValue: _genderValue,
                onChanged: (Gender? gender) {
                  debugPrint("$gender");
                  setState(() {
                    _genderValue = gender;
                  });
                })
          ],
        )
      ],
    );
  }
}
