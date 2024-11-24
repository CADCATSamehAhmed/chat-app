import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'build_add_status_icon.dart';

class BuildMyStatusAvatar extends StatelessWidget {
  const BuildMyStatusAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 25.r,
          backgroundImage: const NetworkImage(
            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
        ),
        const Positioned(
          bottom: 0,
          right: 0,
          child: BuildAddStatusIcon(),
        ),
      ],
    );
  }
}
