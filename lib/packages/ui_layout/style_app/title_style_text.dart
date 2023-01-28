import 'package:flutter/material.dart';
import 'package:market_app/packages/ui_layout/style_app/text_style.dart';

Widget titleStyleText({required String titleText, required context}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 18.0),
    child: Text(
      titleText,
      style: myTextStyleFontS8Sans(
        context: context,
        fontSize: 28,
        newFontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
