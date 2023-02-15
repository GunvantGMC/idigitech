import 'package:flutter/animation.dart';
import 'package:idigitech/Services.dart/CstmTheme.dart';

class CategoryData {
  Color color;
  String title;
  String img;

  CategoryData({
    this.color = CstmTheme.secondaryColor,
    required this.title,
    required this.img,
  });
}
