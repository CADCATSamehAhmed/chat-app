import 'package:chat_app_team_mentor/core/themes/app_styles.dart';
import 'package:chat_app_team_mentor/features/status/presentation/views/widgets/build_my_status_avatar.dart';
import 'package:flutter/material.dart';

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
        style: AppStyles.styleBlack20,
      ),
      subtitle: Text(
        'Tap to add status update',
        style: AppStyles.styleBlack18,
      ),
      leading: const BuildMyStatusAvatar(),
    );
  }
}
