import 'dart:async';
import 'package:chat_app/features/auth/presentation/views/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/splash_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
        Get.off(()=>const SignIn());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
