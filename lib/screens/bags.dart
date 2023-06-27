import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/screens/drawer.dart';

class BagsPage extends StatefulWidget {
  const BagsPage({super.key});

  @override
  State<BagsPage> createState() => _BagsPageState();
}

class _BagsPageState extends State<BagsPage> {
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
