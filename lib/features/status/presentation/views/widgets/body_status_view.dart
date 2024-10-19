import 'package:chat_app_team_mentor/core/themes/app_colors.dart';
import 'package:chat_app_team_mentor/features/status/presentation/views/widgets/build_my_status_tile.dart';
import 'package:chat_app_team_mentor/features/status/presentation/views/widgets/build_section_title.dart';
import 'package:chat_app_team_mentor/features/status/presentation/views/widgets/build_status_list_tile.dart';
import 'package:flutter/material.dart';

class BodyStatusView extends StatelessWidget {
  const BodyStatusView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: ListView(
        children: [
          const BuildMyStatusTile(),
          const SizedBox(height: 15),
          const BuildSectionTitle(
            title: 'Recent updates',
          ),
          const SizedBox(height: 15),
          const BuildStatusListView(),
          const SizedBox(height: 15),
          const BuildSectionTitle(
            title: 'Viewed updates',
          ),
          const SizedBox(height: 15),
          BuildStatusListView(
            borderColor: AppColors.black.withOpacity(
              0.3,
            ),
          ),
        ],
      ),
    );
  }
}
