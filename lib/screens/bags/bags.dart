import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/screens/drawer/drawer.dart';
import 'package:lc_waikiki_app/services/card_data.dart';
import 'package:lc_waikiki_app/services/product_card.dart';

class BagsPage extends StatefulWidget {
  const BagsPage({super.key});

  @override
  State<BagsPage> createState() => _BagsPageState();
}

class _BagsPageState extends State<BagsPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final List<Product> products = [];
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
              icon: const Icon(Icons.shopping_cart_sharp),
              tooltip: 'Cart',
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            products.isNotEmpty
                ? GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    padding: const EdgeInsets.all(10),
                    childAspectRatio: 0.75,
                    children: products
                        .map((prod) => ProductCard(data: prod))
                        .toList(),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            'Sorry, We Couldnt find any products for this category.',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            'Below are some recomended categories for you',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 35),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25))),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 4),
                                    child: Center(
                                      child: TextButton(
                                        child: const Text(
                                          "Men's Outwear",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context, '/mens_wear');
                                        },
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25))),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 4),
                                    child: Center(
                                      child: TextButton(
                                        child: const Text(
                                          "Ladies' Outwear",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context, '/ladies_wear');
                                        },
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 35),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25))),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 4),
                                    child: Center(
                                      child: TextButton(
                                        child: const Text(
                                          "Men's T-Shirts",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context, '/mens_t_shirts');
                                        },
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25))),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 4),
                                    child: Center(
                                      child: TextButton(
                                        child: const Text(
                                          "Ladies' T-Shirts",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context, '/ladies_t_shirts');
                                        },
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25))),
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 4),
                          width: 150,
                          child: Center(
                            child: TextButton(
                              child: const Text(
                                'Laptop BackPacks',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/bags');
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  )
          ],
        ));
  }
}
