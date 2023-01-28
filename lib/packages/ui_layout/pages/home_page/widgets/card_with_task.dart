import 'package:flutter/material.dart';
import 'package:market_app/packages/ui_layout/pages/home_page/pages/about_task_page/pages/orders_to_fulfill_page/orders_to_fulfill_page.dart';
import 'package:market_app/packages/ui_layout/style_app/consts_app.dart';
import 'package:market_app/packages/ui_layout/style_app/container_style.dart';
import 'package:market_app/packages/ui_layout/style_app/text_style.dart';

class CardWithTask extends StatelessWidget {
  const CardWithTask({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: myStyleContainer(context: context).copyWith(
        // color: theme.textTheme.bodySmall!.color!.withOpacity(0.3),
        color: myColorIsActive.withOpacity(0.4),
        border: Border.all(
          width: 2,
          color: theme.textTheme.titleLarge!.color!,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: myTextStyleFontS8Sans(
            context: context,
            newFontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
