import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/sections/book_cart/providers/book_provider.dart';
// import 'package:flutter_complete_guide/sections/book_cart/providers/book_provider.dart';
import 'package:provider/provider.dart';

class BookGridTile extends StatelessWidget {
  // const BookGridTile({required Book data, Key? key})
  //     : _data = data,
  //       super(key: key);

  // final Book _data;
  const BookGridTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _book = Provider.of<BookProvider>(context);
    final _data = _book.data;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          _data.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<BookProvider>(
            builder: (context, product, _) => IconButton(
                onPressed: () {
                  _book.toggleFavoriteStatus();
                },
                icon: Icon(
                  product.data.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: product.data.isFavorite ? Colors.red : Colors.white,
                )),
          ),
          title: Text(
            _data.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ),
      ),
    );
  }
}
