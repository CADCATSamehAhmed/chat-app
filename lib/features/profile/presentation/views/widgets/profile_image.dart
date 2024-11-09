import 'package:chat_app/core/constants/images.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: const AssetImage(Images.profile),
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
