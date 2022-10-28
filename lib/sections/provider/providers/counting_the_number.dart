import 'package:flutter/material.dart';

class CountingTheNumber with ChangeNotifier {
  int counting = 0;

  void increaseCounting() {
    counting++;
    notifyListeners();
  }

  void decreaseCounting() {
    counting--;
    notifyListeners();
  }
}
