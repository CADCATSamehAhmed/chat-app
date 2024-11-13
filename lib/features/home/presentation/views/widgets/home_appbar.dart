import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/data/view_model/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/views/sign_in/sign_in.dart';
import 'package:chat_app/features/home/presentation/views/widgets/search_body.dart';
import 'package:chat_app/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey menuKey = GlobalKey();
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Text(
        'WhatsApp',
        style: AppFonts.font25,
      ),
      actions: [
        IconButton(
          iconSize: 30,
          onPressed: () {
            showSearch(context: context, delegate: CustomSearch());
          },
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: PopupMenuButton<String>(
              key: menuKey,
              onSelected: (String value) {
                if (value == 'New Group') {
                } else if (value == 'Profile') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProfileView()));
                } else if (value == 'Logout') {
                  AuthCubit authCubit = AuthCubit();
                  authCubit.logOut().then(
                      // ignore: use_build_context_synchronously
                      (onValue) => Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ),
                            (route) => false,
                          ));
                }
              },
              itemBuilder: (BuildContext context) {
                return items.map<PopupMenuEntry<String>>((String value) {
                  return PopupMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: AppFonts.font14,
                    ),
                  );
                }).toList();
              },
              child: IconButton(
                onPressed: () {
                  final dynamic state = menuKey.currentState;
                  state.showButtonMenu();
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              )),
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

final List<String> items = ['New Group', 'Profile', 'Logout'];
