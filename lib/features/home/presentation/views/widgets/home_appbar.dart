import 'package:chat_app/core/shared_widgets/default_loading.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:chat_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:chat_app/features/home/presentation/view_model/home_states.dart';
import 'package:chat_app/features/home/presentation/views/widgets/search_body.dart';
import 'package:chat_app/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

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
          iconSize: 25.sp,
          onPressed: () {
            showSearch(context: context, delegate: CustomSearch());
          },
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15).w,
          child: BlocConsumer<HomeCubit, HomeStates>(
              listener: (context, state) {
                if(state is LogOutSuccess){
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.theme,
                      child: const SignInView(),
                    ),
                  );
                }
              },
              builder: (context, state) {
                HomeCubit homeCubit = HomeCubit.get(context);
                return PopupMenuButton<String>(
                    key: menuKey,
                    onSelected: (String value) {
                      if (value == 'New Group') {
                      } else if (value == 'Profile') {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProfileView()));
                      } else if (value == 'Logout') {
                        defaultLoading(context: context, asyncFunction: homeCubit.logOut());
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
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                        size: 25.sp,
                      ),
                    ));
              }),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(5.h),
        child: SizedBox(
          height: 5.h,
          child: const Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}

final List<String> items = ['New Group', 'Profile', 'Logout'];
