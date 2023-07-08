import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/screens/drawer/drawer.dart';
import 'package:lc_waikiki_app/services/card_data.dart';
import 'package:lc_waikiki_app/services/product_card.dart';

class LadiesWearPage extends StatefulWidget {
  const LadiesWearPage({super.key});

  @override
  State<LadiesWearPage> createState() => _LadiesWearPageState();
}

class _LadiesWearPageState extends State<LadiesWearPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  List<Product> products = [
    const Product(
        name: 'Ladies Modern Streach Full Zip',
        price: 41,
        image: 'assets/images/10-24102A.jpg'),
    const Product(
        name: 'Ladies Colorblock Wind Jacket',
        price: 36,
        image: 'assets/images/10-25058A.jpg'),
    const Product(
        name: 'Ladies Voyage Fleece Jacket',
        price: 48,
        image: 'assets/10-11017A.jpg'),
    const Product(
        name: 'adies Pullover L/S Hood',
        price: 33,
        image: 'assets/10-11017A.jpg'),
    const Product(
        name: 'Ladies Sonoma Hybrid Knit Jacket',
        price: 40,
        image: 'assets/images/10-24097A.jpg'),
    const Product(
        name: 'Ladies Yerba Knit Quarter Zip',
        price: 37,
        image: 'assets/images/10-24099A.jpg'),
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
        body: ListView(
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              padding: const EdgeInsets.all(10),
              childAspectRatio: 0.75,
              children:
                  products.map((prod) => ProductCard(data: prod)).toList(),
            )
          ],
        ));
  }
}
