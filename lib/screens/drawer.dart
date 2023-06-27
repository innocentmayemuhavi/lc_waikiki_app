import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerState();
}

class _DrawerState extends State<DrawerPage> {
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text(
          'Alert !',
          style: TextStyle(
            color: Color(0xffffd50000),
          ),
        ),
        content: const Text('Proceed To Log Out?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/auth');
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0,
      width: 230,
      child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          children: <Widget>[
            Row(
              children: [
                IconButton(
                  tooltip: 'back',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    semanticLabel: 'back',
                  ),
                  iconSize: 24,
                ),
                const SizedBox(
                  width: 30,
                ),
                const SizedBox(
                  child: Center(
                    child: Text(
                      'Shop',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, '/')
                    // Navigator.pushNamed(context, '/auth')
                  },
                  leading: const Icon(
                    Icons.home,
                    size: 22,
                  ),
                  title: const Text(
                    'Home',
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, '/ladies_wear')
                    // Navigator.pushNamed(context, '/auth')
                  },
                  leading: const Icon(
                    Icons.woman_2_sharp,
                    size: 22,
                  ),
                  title: const Text(
                    'Ladies Wear',
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, '/mens_wear')
                    // Navigator.pushNamed(context, '/auth')
                  },
                  leading: const Icon(
                    Icons.man_sharp,
                    size: 22,
                  ),
                  title: const Text(
                    'Mens Out wear',
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, '/bags')
                    // Navigator.pushNamed(context, '/auth')
                  },
                  leading: const Icon(
                    Icons.backpack,
                    size: 22,
                  ),
                  title: const Text(
                    'Laptop Bags',
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                    _showAlertDialog(context),
                  },
                  leading: const Icon(
                    Icons.logout_rounded,
                    color: Color(0xffffd50000),
                    size: 22,
                  ),
                  title: const Text(
                    'Log Out',
                    style: TextStyle(color: Color(0xffffd50000)),
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
