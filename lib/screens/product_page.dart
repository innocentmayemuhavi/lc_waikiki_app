import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/screens/drawer.dart';
import 'package:lc_waikiki_app/services/product_data.dart';

import '../services/card_data.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  void _showAlertDialog(BuildContext context, ProductData product) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text(
          'Success!',
          style: TextStyle(
            color: Color.fromARGB(255, 6, 109, 11),
          ),
        ),
        content: Text(
          "You Have Added ${product.name} of size ${product.size} to Cart of Price KES: ${product.price}",
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/cart');
            },
            child: const Text(
              'View Cart',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  int quantity = 1;
  String size = 'Small';

  List<int> options = [1, 2, 3];

  List<String> option = ['Small', 'Medium', 'Large'];
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    final Product? data =
        ModalRoute.of(context)?.settings.arguments as Product?;
    ProductData product = ProductData(
      size: size,
      Quantity: quantity,
      price: data!.price * quantity,
      name: data.name,
    );

    return Scaffold(
      key: _scaffoldkey,
      drawerEnableOpenDragGesture: true,
      drawer: const DrawerPage(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
          tooltip: 'Menu',
        ),
        title: const Text('Shop'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => {Navigator.pushNamed(context, '/cart')},
            icon: const Icon(Icons.shopping_basket),
            tooltip: 'Cart',
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          const CupertinoActivityIndicator(),
          if (data != null)
            Container(
              child: Column(
                children: [
                  Image.asset(data.image),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.name,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    " KES ${data.price.toString()}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<String>(
                    value: size,
                    decoration: const InputDecoration(
                      labelText: 'Select Size',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 1,
                        horizontal: 10,
                      ),
                      prefix: Text(
                        'Size:',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    items: option.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        size = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<int>(
                    value: quantity,
                    decoration: const InputDecoration(
                      labelText: 'Select Quantity',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 1,
                        horizontal: 10,
                      ),
                      prefix: Text(
                        'Quantity:',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    items: options.map((int option) {
                      return DropdownMenuItem<int>(
                        value: option,
                        child: Text(option.toString()),
                      );
                    }).toList(),
                    onChanged: (int? value) {
                      setState(() {
                        quantity = value!;
                        print(value);
                        print(quantity);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[200],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                        side: const BorderSide(color: Colors.black, width: 2),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () async {
                      // ...

                      setState(() {
                        product = ProductData(
                          size: size,
                          Quantity: quantity,
                          price: data.price * quantity,
                          name: data.name,
                        );
                      });

                      print("Updated Quantity: $quantity");
                      print("Updated Size: $size");
                      _showAlertDialog(context, product);
                    },
                    child: const Text('Add To Cart'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
