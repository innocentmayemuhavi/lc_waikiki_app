import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Function toogleView;
  Login({super.key, required this.toogleView});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const CupertinoActivityIndicator(),
          TextButton(
              onPressed: () => {widget.toogleView()},
              child: const Text('Sign Up'))
        ],
      ),
    );
  }
}
