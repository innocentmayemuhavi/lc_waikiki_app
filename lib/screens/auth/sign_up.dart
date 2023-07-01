import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lc_waikiki_app/firebase/auth.dart';
import 'package:lc_waikiki_app/screens/loading/loading_page.dart';
import 'package:lc_waikiki_app/shared/styles.dart';

class SignUp extends StatefulWidget {
  Function toogleView;
  SignUp({super.key, required this.toogleView});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password = '';
  String error = '';
  bool isloading = false;
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return isloading
        ? const Loading()
        : Scaffold(
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
                  'Sign Up',
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      error,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Enter An Email' : null,
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
                      validator: (value) =>
                          value!.isEmpty ? 'Enter Password' : null,
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 20),
                        child: const Text('Sign Up'),
                        onPressed: () async {
                          setState(() {
                            isloading = true;
                          });
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          setState(() {
                            isloading = false;
                          });
                          if (result == null) {
                            setState(() {
                              error = 'Wrong Email or Password';
                            });
                          }
                        })
                  ],
                )),
                Row(
                  children: [
                    const Text('Already have account?'),
                    CupertinoButton(
                        child: const Text('Login'),
                        onPressed: () => {widget.toogleView()})
                  ],
                )
              ],
            ),
          )));
  }
}
