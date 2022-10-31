import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/sections/book_cart/providers/books_provider.dart';
import 'package:flutter_complete_guide/sections/book_cart/screens/widgets/book_grid_tile.dart';
import 'package:provider/provider.dart';

class BooksGridScreen extends StatelessWidget {
  static const routeName = '/books-grid';
  const BooksGridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _data = Provider.of<BooksProvider>(context);
    final _books = _data.books;
    return Scaffold(
      appBar: AppBar(title: const Text('Books Grid')),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: _books.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: _books[index], child: const BookGridTile())
          //BookGridTile(data: _books[index]),
          ),
    );
  }
}
