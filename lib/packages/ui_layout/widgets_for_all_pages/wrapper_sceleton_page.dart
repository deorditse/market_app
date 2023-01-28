import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/packages/business_layout/lib/business_layout.dart';
import 'package:market_app/packages/ui_layout/style_app/consts_app.dart';

class WrapperSceletonPage extends StatelessWidget {
  const WrapperSceletonPage({
    Key? key,
    required this.child,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);
  final Widget child;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: myWithBetweenContent / 1.5,
                vertical: Platform.isAndroid ? myWithBetweenContent : 0,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
