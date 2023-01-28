import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

const SizedBox mySizedHeightBetweenContainer = SizedBox(height: 14);
const double myWithBetweenContent = 10;
const Color myColorIsActive = Colors.orange;

///цвета для текста
const Color myColorTextBlue = Color.fromRGBO(12, 50, 122, 1);

///цвета для кнопок
const Color myColorButton1 = Color.fromRGBO(236, 237, 240, 1);
const Color myColorButton2 = Color.fromRGBO(247, 247, 248, 1);


Widget myIconBackAppBar({required BuildContext context, double? sizeIcon}) =>
    SizedBox(
      // width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
          // left: myHorizontalPaddingForContainer,
        ),
        child: Icon(
          Icons.arrow_back_ios_new_sharp,
          size: sizeIcon ?? 30,
        ),
      ),
    );

Icon myIconForward({Color? color, required BuildContext context}) => Icon(
      Icons.arrow_forward_ios,
      color: color ?? Theme.of(context).textTheme.headline1!.color,
      // weight: 1,
    );
