import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/features/chat/presentation/views/main_chats.dart';
import 'package:chat_app/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:chat_app/features/home/presentation/views/widgets/home_floating_action_button.dart';
import 'package:chat_app/features/status/presentation/views/status_view.dart';
import 'package:flutter/material.dart';
import 'widgets/home_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackGroundColor,
      appBar: const BuildAppBar(),
      body: homeScreens[currentIndex],
      bottomNavigationBar: BottomNavBar(
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          }),
      floatingActionButton: HomeFloatingActionButton(index: currentIndex),
    );
  }
}

List<Widget> homeScreens = [
  const MainChats(),
  const StatusView(),
  Container(),
];
