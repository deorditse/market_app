import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/packages/data_layout/lib/data_layout.dart';
import 'package:models/models.dart';
import 'package:market_app/packages/ui_layout/style_app/consts_app.dart';
import 'package:market_app/packages/ui_layout/style_app/container_style.dart';
import 'package:market_app/packages/ui_layout/style_app/style_buttons.dart';
import 'package:market_app/packages/ui_layout/style_app/text_field_style.dart';
import 'package:market_app/packages/ui_layout/style_app/text_style.dart';
import 'package:market_app/packages/ui_layout/style_app/title_style_text.dart';
import 'package:market_app/packages/ui_layout/pages/auth_page/widgets/validate_email.dart';
import 'package:market_app/packages/ui_layout/widgets_for_all_pages/wrapper_sceleton_page.dart';
import '../../widgets_for_all_pages/icon_and_message.dart';
import 'package:business_layout/business_layout.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class AuthPage extends StatefulWidget {
  static const String id = '/authPage';

  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // @override
  // void initState() {
  //   FlutterNativeSplash.remove();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    AuthBloc authBlocProvider = BlocProvider.of<AuthBloc>(context);
    return WrapperSceletonPage(
      resizeToAvoidBottomInset: false,
      child: Center(
        child: SizedBox(
          height: 400,
          width: double.infinity,
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.messageError != null) {
                return Column(
                  children: [
                    IconAndMessage(
                      icon: const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 120,
                      ),
                      message: "Ошибка входа:\n${state.messageError}",
                    ),
                    mySizedHeightBetweenContainer,
                    mySizedHeightBetweenContainer,
                    MyButton(
                      onTap: () {
                        authBlocProvider.add(InitialAuthEvent());
                      },
                      child: Text(
                        "Повторить вход",
                        style: myTextStyleFontS8Sans(context: context),
                      ),
                    ),
                  ],
                );
              } else if (!state.isLoading) {
                return Container(
                  decoration: myStyleContainer(context: context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 18,
                    ),
                    child: Column(
                      children: [
                        titleStyleText(
                          titleText: 'АВТОРИЗАЦИЯ',
                          context: context,
                        ),
                        Expanded(child: _AuthBody()),
                      ],
                    ),
                  ),
                );
              } else if (state.isLoading) {
                return const IconAndMessage(
                  message: "Выполняется вход",
                );
                // } else if (state is LoadedAuthState) {
                //   return ;
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}

class _AuthBody extends StatelessWidget {
  _AuthBody({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  //"Екатерина"
  final TextEditingController _passwordController = TextEditingController();

  //"6507276063tT!"
  Future<void> _submit({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      BlocProvider.of<AuthBloc>(context).add(
        SignInEvent(
          password: password,
          login: username,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final blocProv = BlocProvider.of<AuthBloc>(context, listen: true).state;
    _passwordController.text = blocProv.password ?? '';
    _nameController.text = blocProv.userName ?? '';

    print(_passwordController.text);
    print(_nameController.text);
    return Column(
      children: [
        Expanded(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  //for testing
                  textCapitalization: TextCapitalization.words,
                  key: Key('fieldEmail'),
                  cursorColor: myColorIsActive,
                  validator: (value) {
                    if (value == '') return 'Введите логин';

                    if (_nameController.text.contains('@') &&
                        !validateEmail(value!)) {
                      return 'Поле содержит недопустимые символы';
                    }
                    return null;
                  },

                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  inputFormatters: <TextInputFormatter>[
                    _UpperCaseTextFormatter()
                    // FilteringTextInputFormatter.singleLineFormatter,
                  ],
                  decoration: myStyleTextField(
                    context,
                    labelText: 'Имя пользователя',
                    hintText: 'Имя пользователя',
                    // helperText: 'Поле для поиска заметок',
                  ),
                ),
                mySizedHeightBetweenContainer,
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  cursorColor: myColorIsActive,
                  controller: _passwordController,
                  key: const Key('fieldPassword'),
                  validator: (value) {
                    if (value == '') return 'Введите пароль';
                    //if (value.length.toInt() > 11) return 'Некорректный номер телефона';
                    return null;
                  },
                  decoration: myStyleTextField(
                    context,
                    labelText: 'Пароль',
                    hintText: '*****',
                    // helperText: 'Поле для поиска заметок',
                  ),
                  onFieldSubmitted: (password) => _submit(
                    context: context,
                    username: _nameController.text,
                    password: password,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter,
                  ],
                  obscureText: true,
                ),
                mySizedHeightBetweenContainer,
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: Text('ВОЙТИ'),
              onPressed: () {
                _submit(
                  context: context,
                  username: _nameController.text,
                  password: _passwordController.text,
                );
              },
            ),
            ElevatedButton(
              child: Text('ОТМЕНА'),
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                _passwordController.clear();
                _nameController.clear();
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalizeFirst(newValue.text),
      selection: newValue.selection,
    );
  }
}
