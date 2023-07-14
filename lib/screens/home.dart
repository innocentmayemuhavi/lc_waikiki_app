import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/screens/drawer/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

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
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
          children: <Widget>[
            SizedBox(
                child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/mensouterwear.jpg'),
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Mens Outwear'),
                const SizedBox(
                  height: 15,
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
                        horizontal: 30,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () =>
                        {Navigator.pushReplacementNamed(context, '/mens_wear')},
                    child: const Text('SHOP NOW'))
              ],
            )),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/ladies_outerwear.jpg'),
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Ladies Outwear'),
                const SizedBox(
                  height: 15,
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
                        horizontal: 30,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () =>
                        {Navigator.pushReplacementNamed(context, '/mens_wear')},
                    child: const Text('SHOP NOW'))
              ],
            )),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          const Image(
                            image: AssetImage('assets/mens_tshirts.jpg'),
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const Text(
                            "Men's T-Shirts",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.grey[200],
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1),
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 45,
                                  vertical: 10,
                                ),
                              ),
                              onPressed: () => {
                                    Navigator.pushReplacementNamed(
                                        context, '/mens_t_shirts')
                                  },
                              child: const Text('SHOP NOW'))
                        ],
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          const Image(
                            image: AssetImage('assets/ladies_tshirts.jpg'),
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const Text(
                            "Ladies' T-Shirts",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.grey[200],
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1),
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 45,
                                  vertical: 10,
                                ),
                              ),
                              onPressed: () => {
                                    Navigator.pushReplacementNamed(
                                        context, '/ladies_t_shirts')
                                  },
                              child: const Text('SHOP NOW'))
                        ],
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
