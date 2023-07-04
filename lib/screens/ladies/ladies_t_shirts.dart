import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/screens/drawer/drawer.dart';
import 'package:lc_waikiki_app/services/card_data.dart';
import 'package:lc_waikiki_app/services/product_card.dart';

class LadiesTShirts extends StatefulWidget {
  const LadiesTShirts({super.key});

  @override
  State<LadiesTShirts> createState() => _LadiesTShirtsState();
}

class _LadiesTShirtsState extends State<LadiesTShirts> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  List<Product> products = [
    const Product(
        name: 'Ladies Voyage Fleece Jacket',
        price: 1200,
        image: 'assets/10-11017A.jpg'),
    const Product(
        name: 'Ladies Voyage Fleece Jacket',
        price: 1200,
        image: 'assets/10-11017A.jpg'),
    const Product(
        name: 'Ladies Voyage Fleece Jacket',
        price: 1200,
        image: 'assets/10-11017A.jpg'),
    const Product(
        name: 'Ladies Voyage Fleece Jacket',
        price: 1200,
        image: 'assets/10-11017A.jpg'),
    const Product(
        name: 'Ladies Voyage Fleece Jacket',
        price: 1200,
        image: 'assets/10-11017A.jpg'),
    const Product(
        name: 'Ladies Voyage Fleece Jacket',
        price: 1200,
        image: 'assets/10-11017A.jpg'),
    const Product(
        name: 'Ladies Voyage Fleece Jacket',
        price: 1200,
        image: 'assets/10-11017A.jpg'),
    const Product(
        name: 'Ladies Voyage Fleece Jacket',
        price: 1200,
        image: 'assets/10-11017A.jpg'),
    const Product(
        name: 'Ladies Voyage Fleece Jacket',
        price: 1200,
        image: 'assets/10-11017A.jpg'),
    const Product(
        name: 'Ladies Voyage Fleece Jacket',
        price: 1200,
        image: 'assets/10-11017A.jpg'),
    const Product(
        name: 'Ladies Voyage Fleece Jacket',
        price: 1200,
        image: 'assets/10-11017A.jpg'),
    const Product(
        name: 'Ladies Voyage Fleece Jacket',
        price: 1200,
        image: 'assets/10-11017A.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        drawerEnableOpenDragGesture: true,
        drawer: const DrawerPage(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => {_scaffoldkey.currentState?.openDrawer()},
            tooltip: 'Menu',
          ),
          title: const Text(
            'Shop',
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () => {Navigator.pushNamed(context, '/cart')},
             icon: const Icon(Icons.shopping_cart_sharp),
              tooltip: 'Cart',
            )
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          padding: const EdgeInsets.all(10),
          childAspectRatio: 0.75,
          children: products.map((prod) => ProductCard(data: prod)).toList(),
        ));
  }
}
