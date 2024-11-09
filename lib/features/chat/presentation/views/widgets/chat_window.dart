import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class ChatWindow extends StatelessWidget {
  final String name;
  final String number;

  const ChatWindow({super.key, required this.name, required this.number});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CircleAvatar(
            radius: 35,
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF9E9E9E),
            child: Icon(
              Icons.person,
              size: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text("# $number",
                    style: const TextStyle(fontSize: 22, color: Colors.grey))
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "12:00 PM",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, bottom: 45),
                child: CircleAvatar(
                  backgroundColor: AppColors.mainColor,
                  foregroundColor: Colors.white,
                  child: const Text("2"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
