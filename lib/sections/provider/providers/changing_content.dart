import 'package:flutter/material.dart';

class ChangingContent with ChangeNotifier {
  List<String> contents = ['Content 1', 'Content 2', 'Content 3'];
  String selectedContent = '';

  ChangingContent() {
    selectedContent = contents.first;
  }

  void changeContent() {
    int _index = contents.indexOf(selectedContent);
    _index++;
    print(_index);
    if (_index == contents.length - 1) {
      _index = 0;
    }
    print(contents[_index]);
    selectedContent = contents[_index];
    notifyListeners();
  }
}
