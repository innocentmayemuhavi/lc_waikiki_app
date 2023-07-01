import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/app.dart';
import 'package:lc_waikiki_app/services/user_class.dart';
import 'package:provider/provider.dart';
import 'firebase/auth.dart';

class Context extends StatefulWidget {
  const Context({super.key});

  @override
  State<Context> createState() => _ContextState();
}

class _ContextState extends State<Context> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserClass?>.value(
      value: AuthService().user,
      initialData: null,
      child: Consumer<UserClass?>(
        builder: (context, user, _) {
          return const MaterialApp(
            home: App(),
          );
        },
      ),
    );
  }
}
