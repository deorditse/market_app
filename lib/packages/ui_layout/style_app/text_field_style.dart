import 'package:flutter/material.dart';
import 'consts_app.dart';
import 'text_style.dart';

InputDecoration myStyleTextField(BuildContext context,
    {labelText, hintText, helperText}) {
  OutlineInputBorder myOutlineInputBorder({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        gapPadding: 0,
        borderSide: BorderSide(
            color: color ?? Colors.transparent, width: color != null ? 1 : 0),
      );

  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 15,
    ),

    isDense: true,
    //уменьшает высоту до минимальной

    enabledBorder: myOutlineInputBorder(),

    focusedBorder: myOutlineInputBorder(),

    errorBorder: myOutlineInputBorder(color: Colors.red),

    focusedErrorBorder: myOutlineInputBorder(),

    errorStyle: myTextStyleFontS8Sans(
        textColor: Colors.red, fontSize: 14, context: null),

    hintStyle: myTextStyleFontS8Sans(
      textColor: Theme.of(context).textTheme.headline3!.color,
      fontSize: 14,
      context: null,
    ),

    labelStyle: myTextStyleFontS8Sans(
      textColor: Theme.of(context).textTheme.headline3!.color,
      fontSize: 14,
      context: null,
    ),
    floatingLabelStyle: TextStyle(fontSize: 0),
    labelText: labelText,
    //'Введите ключ команды',
    helperText: helperText,
    //'Поле для поиска заметок',
    hintText: hintText,
    //'123456',
    fillColor: Colors.white.withOpacity(0.3),

    filled: true,
  );
}

//этот стиль добавлен в тему
ButtonStyle myButtonStyle({Color? buttonBackground}) {
  return ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    // foregroundColor: MaterialStateProperty.all(Colors.red),
    backgroundColor:
        MaterialStateProperty.all(buttonBackground ?? myColorIsActive),
  );
}
