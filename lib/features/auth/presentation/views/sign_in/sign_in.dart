import 'package:flutter/material.dart';
import 'sign_in_body.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SignInBody(),
      ),
    );
  }
}
