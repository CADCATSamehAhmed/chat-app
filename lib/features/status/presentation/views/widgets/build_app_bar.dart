import 'package:chat_app/core/themes/styles.dart';
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
        style: AppFonts.font25,
      ),
      actions: [
        IconButton(
          iconSize: 30,
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.black,
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
            color: Colors.black,
            thickness: 0.5,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
