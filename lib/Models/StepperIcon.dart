// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class StepperIcon {
  int no;
  String title;

  bool isSelected;
  bool isCompleted;

  StepperIcon({
    required this.no,
    required this.title,
    this.isSelected = false,
    this.isCompleted = false,
  });

  updateIsSelected({value = true}) => isSelected = value;
  updateIsCompleted({value = true}) => isCompleted = value;
}
