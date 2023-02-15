// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idigitech/Services.dart/CstmTheme.dart';
import 'package:idigitech/Services.dart/Functions.dart';

class CstmAppBar extends StatelessWidget {
  final String title;
  const CstmAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
      ),
      title: Text(
        title,
        style: cstmTxtStyle(
          fs: 20.0,
          fw: FontWeight.w600,
          fc: CstmTheme.whiteColor,
        ),
      ),
      backgroundColor: CstmTheme.primaryColor,
    );
  }
}
