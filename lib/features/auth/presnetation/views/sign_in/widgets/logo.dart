import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_chat/core/constants/app_icon.dart';

buildLogo(BuildContext context) {
  return Center(
    child: SvgPicture.asset(
      AppIcon.whatsApp,
      placeholderBuilder: (context) => const CircularProgressIndicator(),
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.18,
    ),
  );
}
