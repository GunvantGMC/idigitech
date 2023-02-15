// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idigitech/Services.dart/CstmTheme.dart';
import 'package:idigitech/Services.dart/Functions.dart';

class CntrBtn extends StatelessWidget {
  static String leftSide = "<";
  static String rightSide = ">";

  var title;
  var onBtnPressed;
  bool isLoading = false;
  bool isClickable = true;
  bool isDisabled = false;
  var width;
  Color color = Colors.blue;
  IconData? icon;
  var iconSide = rightSide;
  var vrPadding;
  var hrPadding;
  var hrMargin;
  var radius;
  var txtStyle;

  CntrBtn({
    Key? key,
    required this.title,
    required this.onBtnPressed,
    this.isLoading = false,
    this.isClickable = true,
    this.isDisabled = false,
    this.width,
    this.vrPadding = 10.0,
    this.hrPadding = 15.0,
    this.hrMargin = 20.0,
    this.radius = 14.0,
    this.color = CstmTheme.primaryColor,
    this.txtStyle,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(horizontal: hrMargin),
      width: width == null ? null : (width.toDouble()),
      // width: 180,
      // width: width.toDouble(),
      // height: 50,
      decoration: BoxDecoration(
        color: isDisabled ? CstmTheme.tertiaryColor : color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: isLoading
          ? Container(
              padding: EdgeInsets.symmetric(
                  vertical: vrPadding, horizontal: hrPadding),
              child: Center(
                child:
                    CircularProgressIndicator(color: CstmTheme.secondaryColor),
              ),
            )
          : ClipRRect(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (isClickable && !isDisabled)
                      ? () => onBtnPressed()
                      : null,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: vrPadding, horizontal: hrPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        if (icon != null && iconSide == leftSide)
                          Icon(icon, color: Colors.white),
                        // const SizedBox(width: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "$title",
                            style: txtStyle ??
                                cstmTxtStyle(
                                  fs: 20.0,
                                  fw: FontWeight.w600,
                                  fc: isDisabled
                                      ? CstmTheme.blackColor.withOpacity(0.25)
                                      : CstmTheme.whiteColor,
                                ),
                          ),
                        ),
                        if (icon != null && iconSide == rightSide)
                          Icon(icon, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
