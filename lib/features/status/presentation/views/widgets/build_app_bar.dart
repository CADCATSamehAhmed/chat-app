import 'package:chat_app_team_mentor/core/themes/app_colors.dart';
import 'package:chat_app_team_mentor/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        'WhatsApp',
        style: AppStyles.styleBlack30,
      ),
      actions: [
        IconButton(
          iconSize: 30,
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: AppColors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(value: 1, child: Text('New group')),
              const PopupMenuItem(value: 2, child: Text('Starred messages')),
              const PopupMenuItem(value: 3, child: Text('Settings')),
            ],
          ),
        ),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(5),
        child: SizedBox(
          height: 5,
          child: Divider(
            color: AppColors.black,
            thickness: 0.5,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
