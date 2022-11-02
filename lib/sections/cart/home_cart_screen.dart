import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_complete_guide/sections/cart/models/item.dart';
import 'package:flutter_complete_guide/sections/cart/my_cart_screen.dart';

class HomeCartScreen extends StatefulWidget {
  static const routeName = '/home-cart';
  const HomeCartScreen({Key? key}) : super(key: key);

  @override
  State<HomeCartScreen> createState() => _HomeCartScreenState();
}

class _HomeCartScreenState extends State<HomeCartScreen> {
  late List<Item> items;
  List<Item> cart = [];

  void _getItems() {
    items = Item.populateItems();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
          children: items
              .map((e) => ListTile(
                    title: Text(e.name ?? ''),
                    subtitle: Text('USD ${e.price ?? ''}'),
                    trailing: IconButton(
                      icon: Icon(cart.contains(e)
                          ? Icons.remove_circle
                          : Icons.add_circle),
                      onPressed: () {
                        if (cart.contains(e)) {
                          cart.remove(e);
                        } else {
                          cart.add(e);
                        }
                        setState(() {});
                      },
                    ),
                  ))
              .toList()),
      floatingActionButton: cart.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return MyCartScreen(
                      cart: cart,
                      onCartUpdated: (p0) {
                        cart = p0;
                        setState(() {});
                      },
                    );
                  },
                ));
              },
              label: Row(
                children: [
                  Container(
                    child: Text('${cart.length}'),
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('Cart')
                ],
              )),
    );
  }
}
