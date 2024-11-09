import 'package:flutter/material.dart';

import 'widgets/sign_in_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SignInBody(),
      ),
    );
  }
}
