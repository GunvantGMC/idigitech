import 'package:flutter/animation.dart';
import 'package:idigitech/Services.dart/CstmTheme.dart';

class ShoppingData {
  Color color;
  String title;
  String desc;
  String img;
  int offerPrice;
  int actualPrice;
  int discount;

  ShoppingData({
    this.color = CstmTheme.secondaryColor,
    required this.title,
    required this.desc,
    required this.img,
    required this.offerPrice,
    required this.actualPrice,
    required this.discount,
  });
}
