import 'package:flutter/material.dart';
import 'widgets/body_status_view.dart';
import 'widgets/build_app_bar.dart';

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
