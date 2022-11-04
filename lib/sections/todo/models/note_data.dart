import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/sections/todo/models/note.dart';

class NoteData extends ChangeNotifier {
  List<Note> data = [];

  int get noteCount {
    return data.length;
  }

  void addNote(final String note) {
    final _data = Note(note: note);
    data.insert(0, _data);
    notifyListeners();
  }

  void updateNote(Note note) {
    note.toggleIsChecked();
    notifyListeners();
  }

  void deleteNote(Note note) {
    data.remove(note);
    notifyListeners();
  }
}
