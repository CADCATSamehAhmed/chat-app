import 'package:chat_app_team_mentor/core/themes/app_colors.dart';
import 'package:chat_app_team_mentor/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildStatusListView extends StatelessWidget {
  final Color? borderColor;
  const BuildStatusListView({
    super.key,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        String dayName = DateFormat('EE').format(DateTime.now());
        String time = DateFormat('jm').format(DateTime.now());
        return ListTile(
          onTap: () {},
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            'Moffa',
            style: AppStyles.styleBlack20,
          ),
          subtitle: Text(
            '$dayName, $time',
            style: AppStyles.styleBlack18,
          ),
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: borderColor ?? AppColors.green,
                width: 2,
              ),
            ),
            child: const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              ),
            ),
          ),
        );
      },
    );
  }
}