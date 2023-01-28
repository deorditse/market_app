import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:market_app/packages/ui_layout/style_app/consts_app.dart';
import 'package:market_app/packages/ui_layout/style_app/container_style.dart';
import 'package:market_app/packages/ui_layout/style_app/text_button_style.dart';
import 'package:market_app/packages/ui_layout/style_app/text_style.dart';
import 'package:market_app/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';

class CardAboutTask extends StatelessWidget {
  const CardAboutTask(
      {Key? key, required this.aboutOrders, required this.lengthAboutOrders})
      : super(key: key);
  final InfoOrderModel aboutOrders;
  final int lengthAboutOrders;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 60,
      width: double.infinity,
      decoration: myStyleContainer(context: context).copyWith(
        // color: theme.textTheme.bodySmall!.color!.withOpacity(0.3),
        color: myColorIsActive.withOpacity(0.4),
        border: Border.all(
          width: 2,
          color: theme.textTheme.titleLarge!.color!,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: ContainerForPhotoFuture(
              imagePathFromNetwork: aboutOrders.foto,
            ),
          ),
          Flexible(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(width: myWithBetweenContent),
                Text(
                  aboutOrders.place,
                  overflow: TextOverflow.ellipsis,
                  style: myTextStyleFontS8Sans(
                    context: context,
                    fontSize: 22,
                  ),
                ),
                SizedBox(width: myWithBetweenContent),
                Text(
                  '${lengthAboutOrders} шт',
                  style: myTextStyleFontS8Sans(
                    context: context,
                    fontSize: 22,
                    newFontWeight: FontWeight.w500,
                  ),
                ),
                // SizedBox(width: myWithBetweenContent),
                // SizedBox(width: myWithBetweenContent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
