import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/sections/cart/models/item.dart';

class MyCartScreen extends StatefulWidget {
  static const routeName = '/my-cart';
  const MyCartScreen(
      {required this.cart, required this.onCartUpdated, Key? key})
      : super(key: key);

  final List<Item> cart;
  final Function(List<Item>) onCartUpdated;

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: ListView(
          children: widget.cart
              .map((e) => ListTile(
                    title: Text(e.name ?? ''),
                    subtitle: Text('USD ${e.price ?? ''}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {
                        widget.cart.remove(e);
                        setState(() {});
                        widget.onCartUpdated(widget.cart);
                      },
                    ),
                  ))
              .toList()),
    );
  }
}
