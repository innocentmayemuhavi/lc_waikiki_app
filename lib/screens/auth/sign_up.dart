import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  Function toogleView;
  SignUp({super.key, required this.toogleView});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('SHOP'),
      ),
      body: ListView(
        children: <Widget>[
          const CupertinoActivityIndicator(),
          TextButton(
              onPressed: () => {widget.toogleView()},
              child: const Text('Login'))
        ],
      ),
    );
  }
}
