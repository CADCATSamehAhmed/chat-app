import 'package:chat_app/core/constants/images.dart';
import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  final double size;
  const AuthLogo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage(Images.logo),fit: BoxFit.cover,width: size,),
      ],
    );
  }
}
