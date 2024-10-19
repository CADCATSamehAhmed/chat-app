import 'package:chat_app_team_mentor/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class BuildSectionTitle extends StatelessWidget {
  const BuildSectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.styleBlack18,
    );
  }
}
