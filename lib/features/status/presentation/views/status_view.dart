import 'package:flutter/material.dart';
import 'widgets/status_body.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StatusBody(),
    );
  }
}
