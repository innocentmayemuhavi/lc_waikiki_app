import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> cartitems = [];
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
            icon: const Icon(Icons.shopping_cart_sharp),
            tooltip: 'Cart',
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: <Widget>[
          Center(
            child: cartitems.isEmpty
                ? Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Your Cart',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '(${cartitems.length} items)',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Your Cart Is Empty',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.grey[200],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                              side: const BorderSide(
                                  color: Colors.black, width: 2),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                          ),
                          onPressed: () =>
                              {Navigator.pushReplacementNamed(context, '/')},
                          child: const Text('Add Product'))
                    ],
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Your Cart',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '(${cartitems.length} items)',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Total:   KES 1000'),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.grey[200],
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1),
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                              ),
                              onPressed: () => {},
                              child: const Text('Check Out'))
                        ],
                      ))
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
