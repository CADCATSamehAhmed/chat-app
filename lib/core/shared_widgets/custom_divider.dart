import 'package:flutter/material.dart';

SizedBox buildCustomDivider(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.03,
    width: MediaQuery.of(context).size.width * 0.03,
  );
}
