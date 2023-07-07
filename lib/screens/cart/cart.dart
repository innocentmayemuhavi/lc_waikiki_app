import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/firebase/database.dart';
import 'package:lc_waikiki_app/services/product_data.dart';
import 'package:lc_waikiki_app/services/user_class.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> cartItems = [];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass?>(context);
    final uid = user!.uid.toString();
    DatabaseService databaseService = DatabaseService(uid: uid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Back',
        ),
        title: const Text('Shop'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_sharp),
            tooltip: 'Cart',
          ),
        ],
      ),
      body: StreamBuilder<List<ProductData>>(
        stream: databaseService.getCart(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          List<ProductData>? cartItems = snapshot.data;
          double totalAmount = 0;
          for (var item in cartItems!) {
            totalAmount += item
                .price; // Assuming the ProductData class has a 'price' field
          }

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: <Widget>[
              Center(
                child: cartItems.isEmpty
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
                            '(${cartItems.length} items)',
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
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 10,
                              ),
                            ),
                            onPressed: () =>
                                Navigator.pushReplacementNamed(context, '/'),
                            child: const Text('Add Product'),
                          ),
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
                            '(${cartItems.length} items)',
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              ProductData product = cartItems[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  child: Image.asset(product.image),
                                ),
                                title: Text(product.name),
                                subtitle: Text('Price: KES ${product.price}'),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Total:   KES $totalAmount '),
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
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 25,
                                      vertical: 10,
                                    ),
                                  ),
                                  onPressed: () => {},
                                  child: const Text('Check Out'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
