import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/shared/styles.dart';

class Login extends StatefulWidget {
  Function toogleView;
  Login({super.key, required this.toogleView});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      height: 400,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          const Text(
            'Login',
            style: headerStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
              child: Column(
            children: [
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Enter An Email' : null,
                onChanged: (value) => setState(() {
                  email = value;
                }),
                textAlign: TextAlign.center,
                decoration: inputDecorationstyle.copyWith(
                    labelText: 'Enter Email',
                    suffixIcon: const Icon(
                      Icons.email,
                      size: 20,
                      color: Colors.black54,
                    )),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Enter Password' : null,
                onChanged: (value) => setState(() {
                  password = value;
                }),
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: inputDecorationstyle.copyWith(
                    labelText: 'Enter Password',
                    suffixIcon: const Icon(
                      Icons.lock,
                      size: 20,
                      color: Colors.black54,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton.filled(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                  child: const Text('Login'),
                  onPressed: () => {
                        Navigator.pushNamed(
                          context,
                          '/',
                        )
                      })
            ],
          )),
          Row(
            children: [
              const Text('Dont have account?'),
              CupertinoButton(
                  child: const Text('Sign Up'),
                  onPressed: () => {widget.toogleView()})
            ],
          )
        ],
      ),
    )));
  }
}
