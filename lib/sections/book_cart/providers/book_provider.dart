import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/sections/book_cart/models/book.dart';

class BookProvider with ChangeNotifier {
  BookProvider({required this.data});
  Book data;

  void toggleFavoriteStatus() {
    data.isFavorite = !data.isFavorite;
    notifyListeners();
  }
}
