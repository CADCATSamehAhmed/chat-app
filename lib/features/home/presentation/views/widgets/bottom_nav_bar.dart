import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)?  onTap;
  const BottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.message,size: 25,),label: 'Chats'),
        BottomNavigationBarItem(icon: Icon(Icons.lightbulb_rounded,size: 25,),label: 'Status'),
        BottomNavigationBarItem(icon: Icon(Icons.call,size: 25,),label: 'Calls'),
      ],
      onTap:onTap,
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.mainColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    );
  }
}
