import 'package:flutter/material.dart';

BoxDecoration myStyleContainer({
  bool isCircular = false,
  Color? color,
  double? borderRadius,
  required BuildContext context,
}) {
  return BoxDecoration(
    color: color ?? Theme.of(context).cardColor,
    borderRadius: borderRadius != null
        ? BorderRadius.circular(borderRadius)
        : BorderRadius.circular(isCircular ? 100 : 15),
  );
}
