import 'package:flutter/material.dart';

import 'consts_app.dart';

Widget myTextButton(
        {required VoidCallback onPressed, required Widget child}) =>
    Padding(
      padding: const EdgeInsets.only(bottom: myWithBetweenContent),
      child: TextButton(
        style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.zero)),
        onPressed: onPressed,
        child: child,
      ),
    );
