import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/context.dart';

void main() async {
  WidgetsFlutterBinding().ensureSemantics();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: Context(),
  ));
}
