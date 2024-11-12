import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'sign_in_body.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //to give me state of screen
  @override
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('---------------------------------------------------------User is currently signed out!');
    } else {
      print('----------------------------------------------------------------User is signed in!');
    }
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SignInBody(),
      ),
    );
  }
}
