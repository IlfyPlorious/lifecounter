import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: 'email'
            ),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                labelText: 'password'
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade900,
    );
  }
}
