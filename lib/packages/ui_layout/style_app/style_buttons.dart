import 'package:flutter/material.dart';

import 'consts_app.dart';
import 'text_style.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.customBackgroundColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.customTextColor,
    this.isCircular = false,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTap;
  final Color? customBackgroundColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? customTextColor;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: _styleButton(
        horizontalPadding: horizontalPadding,
        verticalPadding: verticalPadding,
        context: context,
        backgroundColor: customBackgroundColor,
        textColor: customTextColor,
        isCircular: isCircular,
      ),
      onPressed: onTap,
      child: child,
    );
  }
}

ButtonStyle _styleButton({
  required Color? backgroundColor,
  required Color? textColor,
  required bool isCircular,
  required double? verticalPadding,
  required double? horizontalPadding,
  required BuildContext context,
}) {
  return ButtonStyle().copyWith(
    elevation: MaterialStateProperty.all(0),
    padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 30,
        vertical: verticalPadding ?? 20,
      ),
    ),
    overlayColor: MaterialStatePropertyAll(myColorIsActive.withOpacity(0.1)),

    backgroundColor:
        MaterialStatePropertyAll(backgroundColor ?? Colors.transparent),

    // foregroundColor: const MaterialStatePropertyAll(_myCardColorLight),
    textStyle: MaterialStatePropertyAll(
      myTextStyleFontS8Sans(
        textColor: textColor ?? Colors.black,
        context: context,
        fontSize: 20,
        newFontWeight: FontWeight.w500,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isCircular ? 200 : 16),
        side: const BorderSide(
            color: Colors.black, width: 2, style: BorderStyle.solid),
      ),
    ),
  );
}
