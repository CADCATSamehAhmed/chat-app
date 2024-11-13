import 'package:chat_app/features/auth/presentation/views/register/register_body.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// Returns a [Scaffold] widget with a [Center] widget as its body. The
  /// [Center] widget contains a [RegisterBody] widget.
  ///
  /// The [RegisterBody] widget is a [StatefulWidget] that handles the
  /// registration process. It contains a [Form] widget with
  /// [TextFormField]s for the user to enter their name, email, phone, and
  /// password. It also contains a [SizedBox] widget with an [ElevatedButton]
  /// that the user can tap to submit the form.
  ///
  /// The [RegisterBody] widget is centered horizontally and vertically in
  /// the parent [Scaffold] widget.
  ///
  /// The [Scaffold] widget returned by this method is the root of the
  /// [MaterialApp] widget tree for the registration screen.
  /// ****  d6e90c9a-bb3b-4986-a1f6-315787a5858e  ******
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RegisterBody(),
      ),
    );
  }
}
