import 'package:chat_app/features/chat/presentation/views/main_chats.dart';
import 'package:chat_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:chat_app/features/home/presentation/view_model/home_states.dart';
import 'package:chat_app/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:chat_app/features/home/presentation/views/widgets/home_floating_action_button.dart';
import 'package:chat_app/features/status/presentation/views/status_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/home_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return Scaffold(
            appBar: const BuildAppBar(),
            body: homeScreens[homeCubit.bottomNavBarIndex],
            bottomNavigationBar: BottomNavBar(
              currentIndex: homeCubit.bottomNavBarIndex,
              onTap: (int index) {
                homeCubit.changeBottomNavigationBarIndex(index);
              },
            ),
            floatingActionButton: HomeFloatingActionButton(index: homeCubit.bottomNavBarIndex),
          );
        },
      ),
    );
  }
}

List<Widget> homeScreens = [
  const MainChats(),
  const StatusView(),
  Container(),
];
