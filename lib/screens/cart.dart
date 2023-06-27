import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
          tooltip: 'Back',
        ),
        title: const Text('Shop'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.shopping_basket),
            tooltip: 'Cart',
          )
        ],
      ),
      body: ListView(
        children: const <Widget>[Text('Cart Page')],
      ),
    );
  }
}
