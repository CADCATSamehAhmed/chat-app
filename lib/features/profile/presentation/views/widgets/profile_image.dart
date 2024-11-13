import 'package:flutter/material.dart';

class Profileimage extends StatelessWidget {
  const Profileimage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: const AssetImage('images/profile.png'),
      child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
          onPressed: () {
            // add function
          },
          icon: const Icon(Icons.edit),
          color: Colors.white,
        ), // Use ImageProvider here
      ),
    );
  }
}
