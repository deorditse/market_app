import 'package:flutter/material.dart';
import 'package:market_app/packages/ui_layout/style_app/consts_app.dart';
import 'package:market_app/packages/ui_layout/style_app/text_style.dart';

class IconAndMessage extends StatelessWidget {
  const IconAndMessage(
      {Key? key, this.icon, required this.message, this.colorMessage})
      : super(key: key);
  final Widget? icon;
  final String message;
  final Color? colorMessage;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ??
                const CircularProgressIndicator(
                  color: myColorIsActive,
                ),
            mySizedHeightBetweenContainer,
            Text(
              message,
              textAlign: TextAlign.center,
              style: myTextStyleFontS8Sans(
                fontSize: 22,
                context: context,
                textColor: colorMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
