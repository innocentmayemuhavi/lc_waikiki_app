import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/screens/drawer/drawer.dart';
import 'package:lc_waikiki_app/services/card_data.dart';
import 'package:lc_waikiki_app/services/product_card.dart';

class MensPage extends StatefulWidget {
  const MensPage({super.key});

  @override
  State<MensPage> createState() => _MensPageState();
}

class _MensPageState extends State<MensPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  List<Product> products = [
    const Product(
        name: 'Mens Tech Shell Full-Zip',
        price: 34,
        image: 'assets/images/10-15068A.jpg'),
    const Product(
        name: 'Anvil L/S Crew Neck - Grey',
        price: 43,
        image: 'assets/images/10-14154A.jpg'),
    const Product(
        name: 'Green Flex Fleece Zip Hoodie',
        price: 44,
        image: 'assets/images/10-14157A.jpg'),
    const Product(
        name: 'Android Nylon Packable Jacket',
        price: 43,
        image: 'assets/images/10-15041A.jpg'),
    const Product(
        name: 'YouTube Ultimate Hooded Sweatshirt',
        price: 32,
        image: 'assets/images/10-14133A.jpg'),
    const Product(
        name: 'Grey Heather Fleece Zip Hoodie',
        price: 33,
        image: 'assets/images/10-14160A.jpg'),
    const Product(
        name: 'Vastrm Hoodie',
        price: 31,
        image: 'assets/images/10-14153A.jpg'),
    const Product(
        name: 'Recycled Plastic Bottle Hoodie - Green',
        price: 30,
        image: 'assets/images/10-14158A.jpg'),
    const Product(
        name: 'Rowan Pullover Hood',
        price: 43,
        image: 'assets/images/10-14152A.jpg'),
    const Product(
        name: 'Mens Voyage Fleece Jacket',
        price: 41,
        image: 'assets/images/10-14155A.jpg'),
    const Product(
        name: 'Eco-Jersey Chrome Zip Up Hoodie',
        price: 45,
        image: 'assets/images/10-14159A.jpg'),
    const Product(
        name: 'Android Colorblock Hooded Pullover',
        price: 40,
        image: 'assets/images/10-14146A.jpg'),
    const Product(
        name: 'Tri-blend Full-Zip Hoodie',
        price: 43,
        image: 'assets/images/10-14216A.jpg'),
    const Product(
        name: 'Fleece Full-Zip Hoodie',
        price: 32,
        image: 'assets/images/10-14215A.jpg'),
    const Product(
        name: 'Jacquard-Knit Full-Zip Fleece',
        price: 32,
        image: 'assets/images/10-14217A.jpg'),
    const Product(
        name: 'YouTube Unisex Flex Fleece Zip Hoodie',
        price: 55,
        image: 'assets/images/10-15103A.jpg'),
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
        body:ListView(
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
