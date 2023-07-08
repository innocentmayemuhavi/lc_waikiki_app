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
        name: 'Ladies Chrome T-Shirt',
        price: 1200,
        image: 'assets/images/10-23180A.jpg'),
    const Product(
        name: 'Ladies Google New York T-Shirt',
        price: 1200,
        image: 'assets//images/10-23226A.jpg'),
    const Product(
        name: 'Ladies Gmail T-Shirt',
        price: 1200,
        image: 'assets/images/10-23179A.jpg'),
    const Product(
        name: 'Ladies G Logo White T-Shirt',
        price: 1200,
        image: 'assets/images/10-23178A.jpg'),
    const Product(
        name: 'Ladies Android Pride T-Shirt',
        price: 1200,
        image: 'assets/images/10-23177A.jpg'),
    const Product(
        name: 'Ladies Ringspun Crew Neck',
        price: 1200,
        image: 'assets/images/10-23172A.jpg'),
    const Product(
        name: 'Ladies Tri-Blend V-Neck T-Shirt',
        price: 1200,
        image: 'assets/images/10-23227A.jpg'),
    const Product(
        name: 'Bella Ladies Favorite Tee',
        price: 1200,
        image: 'assets/images/10-23228A.jpg'),
    const Product(
        name: 'Ladies Bamboo T-Shirt',
        price: 1200,
        image: 'assets/images/10-23176A.jpg'),
    const Product(
        name: 'Ladies L/S Colorblock Raglan',
        price: 1200,
        image: 'assets/images/10-23173A.jpg'),
    const Product(
        name: 'Bella Scoop-Neck Ladies T-Shirt',
        price: 1200,
        image: 'assets/images/10-23171A.jpg'),
    const Product(
        name: 'Ladies Not For Sale T-Shirt',
        price: 1200,
        image: 'assets/images/10-23225A.jpg'),
    const Product(
        name: 'Ladies Android L/S Stretch T-Shirt',
        price: 1200,
        image: 'assets/images/10-23198A.jpg'),
    const Product(
        name: 'Ladies Mountain View T-Shirt',
        price: 1200,
        image: 'assets/images/10-23229A.jpg'),
    const Product(
        name: 'Ladies Blueprint for a Better Inbox T-Shirt',
        price: 1200,
        image: 'assets/images/10-23169A.jpg'),
    const Product(
        name: 'Ladies Cotton Poly w/ Thermal Tee',
        price: 1200,
        image: 'assets/images/10-23174A.jpg'),
    const Product(
        name: 'Ladies YouTube Favorite Tee',
        price: 1200,
        image: 'assets/images/10-23073A.jpg'),
    const Product(
        name: 'MTV Ladies Yellow T-Shirt',
        price: 1200,
        image: 'assets/images/10-23230A.jpg'),
    const Product(
        name: 'Womens Android Heart T-Shirt',
        price: 1200,
        image: 'assets/images/10-23069A.jpg'),
    const Product(
        name: 'YouTube Organic Cotton T-Shirt - Grey',
        price: 1200,
        image: 'assets/images/10-13058A.jpg'),
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
