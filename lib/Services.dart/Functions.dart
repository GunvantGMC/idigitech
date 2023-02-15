import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idigitech/Services.dart/CstmTheme.dart';

cstmTxtStyle(
    {double fs = 16.0,
    fw,
    fc,
    ff = "Jaldi",
    hg = 1.5,
    dc = TextDecoration.none}) {
  return GoogleFonts.getFont(
    "$ff",
    fontSize: fs,
    fontWeight: fw ?? FontWeight.normal,
    color: fc ?? CstmTheme.blackColor,
    height: hg != null ? hg.toDouble() : 14,
    decoration: dc,
  );
}

showCstmSnackBar({required context, required msg, durInSec = 4}) {
  SnackBar snackBar = SnackBar(
    content: Text('$msg'),
    duration: Duration(seconds: durInSec),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

changePage({required context, required page, isReplacement = false}) {
  return isReplacement
      ? Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => page),
        )
      : Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
}

cstmTextField({
  required cntrl,
  required hintText,
  labelText,
  errorText,
  isNumberOnly = false,
  isTextOnly = false,
  isDisabled = false,
  isObscureText = false,
  icon,
  onIcPressed,
  isReadOnly = false,
  maxLength,
}) {
  return TextField(
    controller: cntrl,
    readOnly: isReadOnly,
    enabled: !isDisabled,
    keyboardType: isNumberOnly
        ? TextInputType.number
        : isTextOnly
            ? TextInputType.name
            : null,
    inputFormatters: isNumberOnly
        ? [FilteringTextInputFormatter.digitsOnly]
        : isTextOnly
            ? [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))]
            : null,
    maxLength: maxLength,
    obscureText: isObscureText,
    style: cstmTxtStyle(
      fs: 18.0,
      fw: FontWeight.normal,
      fc: CstmTheme.tertiaryColor,
    ),
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: CstmTheme.tertiaryColor),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: CstmTheme.tertiaryColor),
      ),
      hintText: "$hintText",
      hintStyle: cstmTxtStyle(
        fs: 16.0,
        fw: FontWeight.normal,
        fc: CstmTheme.blackColor.withOpacity(0.5),
      ),

      labelText: labelText ?? "$hintText",
      labelStyle: cstmTxtStyle(
        fs: 16.0,
        fw: FontWeight.normal,
        fc: CstmTheme.tertiaryColor,
      ),
      // errorText: errorText ,
      errorText: errorText == "" ? null : errorText,
      errorStyle: cstmTxtStyle(
        fs: 12.0,
        fw: FontWeight.w500,
        fc: CstmTheme.redColor,
      ),

      suffixIcon: icon == null || onIcPressed == null
          ? null
          : GestureDetector(
              child: Icon(icon.icon, color: CstmTheme.primaryColor),
              onTap: () => onIcPressed(),
            ),
      counterText: "",
    ),
  );
}
