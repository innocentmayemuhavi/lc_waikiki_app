import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/screens/drawer.dart';
import 'package:lc_waikiki_app/services/card_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          title: const Text('Shop'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () => {Navigator.pushNamed(context, '/cart')},
              icon: const Icon(Icons.shopping_basket),
              tooltip: 'Cart',
            )
          ],
        ),
        body: ListView(
          children: const <Widget>[
            CupertinoActivityIndicator(),
          ],
        ));
  }
}
                