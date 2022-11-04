import 'package:flutter/material.dart';

class Note extends ChangeNotifier {
  final String note;
  bool isChecked;

  Note({required this.note, this.isChecked = false});

  void toggleIsChecked() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
