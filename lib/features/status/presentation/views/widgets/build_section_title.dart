import 'package:chat_app/core/themes/styles.dart';
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
      style: AppFonts.font18,
    );
  }
}
