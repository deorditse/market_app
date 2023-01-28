import 'package:flutter/material.dart';
import 'package:market_app/packages/ui_layout/style_app/consts_app.dart';
import 'package:market_app/packages/ui_layout/style_app/container_style.dart';
import 'icon_and_message.dart';

Future<void> myDefaultDialog({
  required BuildContext context,
  Widget? icon,
  required String message,
  Color? backgroundColor,
  Color? colorMessage,
  bool barrierDismissible = true,
}) async {
  await showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: myStyleContainer(
                color: backgroundColor ?? Colors.white,
                context: context,
              ),
              child: Padding(
                padding: const EdgeInsets.all(myWithBetweenContent),
                child: IconAndMessage(
                  message: message,
                  icon: icon,
                  colorMessage: colorMessage,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
