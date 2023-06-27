import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/screens/auth/login.dart';
import 'package:lc_waikiki_app/screens/auth/sign_up.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginAuth = true;
  void toogleAuth() => {
        setState(() {
          showLoginAuth = !showLoginAuth;
        })
      };
  @override
  Widget build(BuildContext context) {
    if (showLoginAuth) {
      return Login(
        toogleView: toogleAuth,
      );
    } else {
      return SignUp(
        toogleView: toogleAuth,
      );
    }
  }
}
