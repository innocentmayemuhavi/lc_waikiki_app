import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/firebase/database.dart';
import 'package:lc_waikiki_app/screens/drawer/drawer.dart';
import 'package:lc_waikiki_app/services/product_data.dart';
import 'package:lc_waikiki_app/services/user_class.dart';
import 'package:provider/provider.dart';

import '../../services/card_data.dart';

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
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);

              // Navigator.pushNamed(context, '/cart');
            },
            child: const Text(
              'Done',
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

  void _showAlertDialog1(BuildContext context, ProductData product) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text(
          'Failed!',
          style: TextStyle(
            color: Color.fromARGB(255, 247, 6, 6),
          ),
        ),
        content: Text(
          "The Product ${product.name} of size ${product.size} Already exist in cart",
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }

  int quantity = 1;
  String size = 'Small';
  bool isLoading = false;

  List<int> options = [1, 2, 3];

  List<String> option = ['Small', 'Medium', 'Large'];
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass?>(context);
    final uid = user!.uid.toString();
    DatabaseService databaseService = DatabaseService(uid: uid);
    final Product? data =
        ModalRoute.of(context)?.settings.arguments as Product?;
    ProductData product = ProductData(
      size: size,
      quantity: quantity,
      price: data!.price * quantity,
      name: data.name,
      image: data.image,
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
            icon: const Icon(Icons.shopping_cart_sharp),
            tooltip: 'Cart',
          ),
        ],
      ),
      body: StreamBuilder<List<ProductData>>(
        stream: databaseService.getCart(uid),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          List<ProductData>? cartItems = snapshot.data;

          return ListView(
            children: <Widget>[
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        " KES ${(data.price * 140).toString()}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                          labelText: 'Select quantity',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 1,
                            horizontal: 10,
                          ),
                          prefix: Text(
                            'quantity:',
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
                            side: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                            product = ProductData(
                              size: size,
                              quantity: quantity,
                              image: data.image,
                              price: (data.price * 140) * quantity,
                              name: data.name,
                            );
                          });
                          bool exists = cartItems!.any((item) =>
                              item.name == product.name &&
                              item.size == product.size &&
                              item.quantity == product.quantity);
                          if (exists) {
                            print(exists);
                            _showAlertDialog1(context, product);
                            setState(() {
                              isLoading = false;
                            });
                          } else {
                            print(exists);
                            try {
                              await databaseService.addToCart(uid, product);
                              setState(() {
                                isLoading = false;
                              });
                              _showAlertDialog(context, product);
                            } catch (e) {
                              print(e);
                            }
                          }
                        },
                        child: isLoading
                            ? const CupertinoActivityIndicator()
                            : const Text('Add To Cart'),
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
