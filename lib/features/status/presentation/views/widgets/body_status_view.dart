import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'build_my_status_tile.dart';
import 'build_section_title.dart';
import 'build_status_list_tile.dart';

class BodyStatusView extends StatelessWidget {
  const BodyStatusView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const BuildMyStatusTile(),
        SizedBox(height: 15.h),
        const BuildSectionTitle(
          title: 'Recent updates',
        ),
        SizedBox(height: 15.h),
        const BuildStatusListView(),
        SizedBox(height: 15.h),
        const BuildSectionTitle(
          title: 'Viewed updates',
        ),
        SizedBox(height: 15.h),
        BuildStatusListView(
          borderColor: Colors.black.withOpacity(
            0.3,
          ),
        ),
      ],
    );
  }
}
