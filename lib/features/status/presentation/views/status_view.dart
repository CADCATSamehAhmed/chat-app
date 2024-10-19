import 'package:chat_app_team_mentor/features/status/presentation/views/widgets/body_status_view.dart';
import 'package:chat_app_team_mentor/features/status/presentation/views/widgets/build_app_bar.dart';
import 'package:flutter/material.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BuildAppBar(),
      body: BodyStatusView(),
    );
    
  }
}
