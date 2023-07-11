import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/screens/drawer/drawer.dart';
import 'package:lc_waikiki_app/services/card_data.dart';
import 'package:lc_waikiki_app/services/product_card.dart';

class MensTShirts extends StatefulWidget {
  const MensTShirts({super.key});

  @override
  State<MensTShirts> createState() => _MensTShirtsState();
}

class _MensTShirtsState extends State<MensTShirts> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  List<Product> products = [
    const Product(
        name: 'Inbox - Subtle Actions T-Shirt',
        price: 30,
        image: 'assets/images/10-13256A.jpg'),
    const Product(
        name: 'Adult Android Superhero T-Shirt',
        price: 40,
        image: 'assets//images/10-13239A.jpg'),
    const Product(
        name: 'Mens Vintage Heather T-Shirt',
        price: 40,
        image: 'assets/images/10-13264A.jpg'),
    const Product(
        name: 'Basic Black T-Shirt',
        price: 50,
        image: 'assets/images/10-13265A.jpg'),
    const Product(
        name: 'Local Guides T-Shirt',
        price: 60,
        image: 'assets/images/10-13280A.jpg'),
    const Product(
        name: 'Go Gopher T-Shirt in Teal',
        price: 40,
        image: 'assets/images/10-13213A.jpg'),
    const Product(
        name: 'Android Ringspun T-Shirt - Green',
        price: 20,
        image: 'assets/images/10-13285A.jpg'),
    const Product(
        name: 'Organic Cotton Android walking with dog T-shirt',
        price: 30,
        image: 'assets/images/10-13018A.jpg'),
    const Product(
        name: 'Organic Cotton T-Shirt - Red',
        price: 45,
        image: 'assets/images/10-13270A.jpg'),
    const Product(
        name: 'Unisex Gmail T-Shirt',
        price: 58,
        image: 'assets/images/10-13282A.jpg'),
    const Product(
        name: 'Android Soccer T-Shirt',
        price: 66,
        image: 'assets/images/10-13289A.jpg'),
    const Product(
        name: 'Basic Google T-Shirt',
        price: 64,
        image: 'assets/images/10-13262A.jpg'),
    const Product(
        name: 'Tri-Blend V-Neck Tee',
        price: 54,
        image: 'assets/images/10-13273A.jpg'),
    const Product(
        name: 'Heather Pocket Tee - Light Blue',
        price: 43,
        image: 'assets/images/10-13272A.jpg'),
    const Product(
        name: 'Google Now Skyline T-Shirt',
        price: 37,
        image: 'assets/images/10-13276A.jpg'),
    const Product(
        name: 'Tri-Blend G Logo Mens Polo',
        price: 1200,
        image: 'assets/images/10-11019A.jpg'),
    const Product(
        name: 'Tri-Blend Leisure Shirt',
        price: 34,
        image: 'assets/images/10-11017A.jpg'),
    const Product(
        name: 'Wise Android T-Shirt',
        price: 44,
        image: 'assets/images/10-13153A.jpg'),
    const Product(
        name: 'Android Pride T-Shirt',
        price: 42,
        image: 'assets/images/10-13279A.jpg'),
    const Product(
        name: 'Chrome Unisex T-Shirt',
        price: 53,
        image: 'assets/images/10-13286A.jpg'),
    const Product(
        name: 'NY City Lights T-Shirt',
        price: 57,
        image: 'assets/images/10-13271A.jpg'),
    const Product(
        name: 'Omi Tech Tee',
        price: 66,
        image: 'assets/images/10-13267A.jpg'),
    const Product(
        name: 'YouTube S/S Triblend T-Shirt',
        price: 45,
        image: 'assets/images/10-13278A.jpg'),
    const Product(
        name: 'Nest T-Shirt',
        price: 54,
        image: 'assets/images/10-13241A.jpg'),
    const Product(
        name: '98 Short Sleeve Tee',
        price: 45,
        image: 'assets/images/10-13291A.jpg'),
    const Product(
        name: 'Cardboard T-Shirt',
        price: 44,
        image: 'assets/images/10-13260A.jpg'),
    const Product(
        name: 'Short Sleeve Crew Neck Raglan',
        price: 34,
        image: 'assets/images/10-13266A.jpg'),
    const Product(
        name: 'MTV Unisex Blue T-Shirt',
        price: 45,
        image: 'assets/images/10-13292A.jpg'),
    const Product(
        name: 'Organic Me-To-We Tee',
        price: 44,
        image: 'assets/images/10-13268A.jpg'),
    const Product(
        name: 'Tri-Blend Raglan Long Sleeve',
        price: 55,
        image: 'assets/images/10-13274A.jpg'),
    const Product(
        name: 'Blueprint for a Better Inbox T-Shirt',
        price: 55,
        image: 'assets/images/10-13240A.jpg'),
    const Product(
        name: 'YouTube Player T-Shirt - Unisex',
        price: 60,
        image: 'assets//images/10-13097A.jpg'),
    const Product(
        name: 'G Logo White T-Shirt',
        price: 50,
        image: 'assets/images/10-13275A.jpg'),
    const Product(
        name: 'Android Concert T-Shirt',
        price: 70,
        image: 'assets/images/10-13130A.jpg'),
    const Product(
        name: 'Mens Bamboo T-Shirt',
        price: 60,
        image: 'assets/images/10-13269A.jpg'),
    const Product(
        name: 'Android Pay Crew Neck T-Shirt',
        price: 70,
        image: 'assets/images/10-13263A.jpg'),
    const Product(
        name: 'Google Maps T-Shirt',
        price: 69,
        image: 'assets/images/10-13277A.jpg'),
    const Product(
        name: 'Est. 98 Baseball Tee',
        price: 70,
        image: 'assets/images/10-13290A.jpg'),
    const Product(
        name: 'Mountain View T-Shirt',
        price: 56,
        image: 'assets/images/10-13288A.jpg'),
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
