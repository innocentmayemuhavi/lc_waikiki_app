import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/screens/auth/auth.dart';
import 'package:lc_waikiki_app/screens/home.dart';
import 'package:lc_waikiki_app/services/user_class.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<UserClass?>(context);
    print('maye app initializing');
    print(data);
    if (data != null) {
      return const HomePage();
    } else {
      return const AuthPage();
    }
  }
}
