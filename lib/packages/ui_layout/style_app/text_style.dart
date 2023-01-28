import 'package:flutter/material.dart';

TextStyle myTextStyleFontS8Sans({
  double? fontSize,
  Color? textColor,
  FontWeight? newFontWeight,
  required BuildContext? context,
}) =>
    TextStyle(
      color: textColor ?? Colors.black,
      fontFamily: 'S8Sans',
      fontStyle: FontStyle.normal,
      fontSize: fontSize ?? 18,
      fontWeight: newFontWeight ?? FontWeight.w600,
    );
