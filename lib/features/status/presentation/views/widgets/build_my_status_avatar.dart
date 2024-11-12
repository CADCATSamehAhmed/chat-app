import 'package:flutter/material.dart';

import 'build_add_status_icon.dart';

class BuildMyStatusAvatar extends StatelessWidget {
  const BuildMyStatusAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: BuildAddStatusIcon(),
        ),
      ],
    );
  }
}
