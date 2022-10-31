import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increase() {
    _counter++;
    notifyListeners();
  }

  void decrease() {
    _counter--;
    notifyListeners();
  }
}
