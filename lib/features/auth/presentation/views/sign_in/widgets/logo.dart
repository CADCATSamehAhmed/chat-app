import 'package:chat_app/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

buildLogo(BuildContext context) {
  return Center(
    child: SvgPicture.asset(
      Images.whatsApp,
      placeholderBuilder: (context) => const CircularProgressIndicator(),
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.18,
    ),
  );
}
