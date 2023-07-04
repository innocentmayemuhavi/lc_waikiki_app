import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/app.dart';
import 'package:lc_waikiki_app/screens/auth/auth.dart';
import 'package:lc_waikiki_app/screens/bags/bags.dart';
import 'package:lc_waikiki_app/screens/cart/cart.dart';
import 'package:lc_waikiki_app/screens/cart/checkout.dart';
import 'package:lc_waikiki_app/screens/error/error_page.dart';
import 'package:lc_waikiki_app/screens/home.dart';
import 'package:lc_waikiki_app/screens/ladies/ladies_t_shirts.dart';
import 'package:lc_waikiki_app/screens/ladies/ladies_wear.dart';
import 'package:lc_waikiki_app/screens/loading/loading_page.dart';
import 'package:lc_waikiki_app/screens/men/men_t_shirts.dart';
import 'package:lc_waikiki_app/screens/men/mens_wear.dart';
import 'package:lc_waikiki_app/screens/product/product_page.dart';
import 'package:lc_waikiki_app/services/user_class.dart';
import 'package:provider/provider.dart';
import 'firebase/auth.dart';

class Context extends StatefulWidget {
  const Context({Key? key}) : super(key: key);

  @override
  _ContextState createState() => _ContextState();
}

class _ContextState extends State<Context> {
  // Define the routes map
  final Map<String, WidgetBuilder> routes = {
    '/': (context) => const App(),
    '/home': (context) => const HomePage(),
    '/loading': (context) => const Loading(),
    '/cart': (context) => const CartPage(),
    '/auth': (context) => const AuthPage(),
    '/checkout': (context) => const CheckOutPage(),
    '/mens_wear': (context) => const MensPage(),
    '/ladies_wear': (context) => const LadiesWearPage(),
    '/bags': (context) => const BagsPage(),
    '/unknown': (context) => const ErrorPage(),
    '/productpage': (context) => const ProductPage(),
    '/mens_t_shirts': (context) => const MensTShirts(),
    '/ladies_t_shirts': (context) => const LadiesTShirts()
  };

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserClass?>.value(
      value: AuthService().user,
      initialData: null,
      child: Consumer<UserClass?>(
        builder: (context, user, _) {
          return MaterialApp(
            initialRoute: '/',
            routes: routes,
            onUnknownRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const ErrorPage(),
              );
            },
            onGenerateRoute: (settings) {
              if (settings.name != null) {
                // Check if route exists in the routes map
                final WidgetBuilder? builder = routes[settings.name];
                if (settings.name == '/cart' && builder != null) {
                  return MaterialPageRoute(
                    builder: builder,
                  );
                }
              }

              return MaterialPageRoute(
                builder: (context) => const ErrorPage(),
              );
            },
          );
        },
      ),
    );
  }
}
