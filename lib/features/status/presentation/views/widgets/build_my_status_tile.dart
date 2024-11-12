import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

import 'build_my_status_avatar.dart';

class BuildMyStatusTile extends StatelessWidget {
  const BuildMyStatusTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      title: Text(
        'My Status',
        style: AppFonts.font20,
      ),
      subtitle: Text(
        'Tap to add status update',
        style: AppFonts.font18,
      ),
      leading: const BuildMyStatusAvatar(),
    );
  }
}
