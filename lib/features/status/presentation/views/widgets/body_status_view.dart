import 'package:flutter/material.dart';

import 'build_my_status_tile.dart';
import 'build_section_title.dart';
import 'build_status_list_tile.dart';

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
            borderColor: Colors.black.withOpacity(
              0.3,
            ),
          ),
        ],
      ),
    );
  }
}
