import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/screens/auth/auth.dart';
import 'package:lc_waikiki_app/screens/bags.dart';
import 'package:lc_waikiki_app/screens/checkout.dart';
import 'package:lc_waikiki_app/screens/error_page.dart';
import 'package:lc_waikiki_app/screens/home.dart';
import 'package:lc_waikiki_app/screens/ladies_wear.dart';
import 'package:lc_waikiki_app/screens/loading/loading_page.dart';
import 'package:lc_waikiki_app/screens/mens_wear.dart';
import 'package:lc_waikiki_app/screens/cart.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/loading': (context) => const Loading(),
        '/cart': (context) => const CartPage(),
        '/auth': (context) => const AuthPage(),
        '/checkout': (context) => const CheckOutPage(),
        '/mens_wear': (context) => const MensPage(),
        '/ladies_wear': (context) => const LadiesWearPage(),
        '/bags': (context) => const BagsPage(),
        '/unknown': (context) => const ErrorPage()
      },
    ));
