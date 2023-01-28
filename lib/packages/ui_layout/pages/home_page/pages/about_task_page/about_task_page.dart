import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/packages/ui_layout/style_app/consts_app.dart';
import 'package:market_app/packages/ui_layout/style_app/style_buttons.dart';

import 'package:market_app/packages/ui_layout/style_app/text_button_style.dart';
import 'package:market_app/packages/ui_layout/style_app/text_style.dart';
import 'package:market_app/packages/ui_layout/widgets_for_all_pages/icon_and_message.dart';
import 'package:market_app/packages/ui_layout/widgets_for_all_pages/wrapper_sceleton_page.dart';
import 'package:business_layout/business_layout.dart';

import 'pages/orders_to_fulfill_page/orders_to_fulfill_page.dart';
import 'pages/orders_to_fulfill_page/pages/qr_code_scanner_page.dart';
import 'widgets/card_about_task.dart';
import 'widgets/top_container_with_info/top_container_with_info.dart';
import 'package:models/models.dart';
import 'package:http/http.dart' as http;

class AboutTaskPage extends StatefulWidget {
  static const String id = '/aboutTaskPage';

  AboutTaskPage({Key? key, required this.title, required this.location})
      : super(key: key);
  final String title;
  final Location location;

  @override
  State<AboutTaskPage> createState() => _AboutTaskPageState();
}

class _AboutTaskPageState extends State<AboutTaskPage> {
  final AboutTaskBlocs blocAboutTasks = AboutTaskBlocs();

  late final ListRoomsBloc listRoomsBloc;

  @override
  void initState() {
    super.initState();
    listRoomsBloc = ListRoomsBloc()
      ..add(
        GetListRoomsEvent(
          location: widget.location,
          userName: context.read<AuthBloc>().state.userName!,
          password: context.read<AuthBloc>().state.password!,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AboutTaskBlocs>(
          create: (_) => blocAboutTasks,
        ),
        BlocProvider<ListRoomsBloc>(
          lazy: false,
          create: (_) => listRoomsBloc,
        ),
      ],
      child: WrapperSceletonPage(
        child: Column(
          children: [
            TopContainerWithInfo(
              title: widget.title,
              location: widget.location,
              // context.read<AuthBloc>().state.userName!,
            ),
            mySizedHeightBetweenContainer,
            Expanded(
              child: BlocBuilder<AboutTaskBlocs, ListAboutTasksInitialState>(
                builder: (_, state) {
                  if (state is ListAboutTasksState) {
                    return state.mapPlaceAndListInfoOrderModel.isNotEmpty
                        ? Scrollbar(
                            thickness: 2,
                            trackVisibility: true,
                            child: ListView.builder(
                              shrinkWrap: true,
                              // primary: false,
                              itemCount:
                                  state.mapPlaceAndListInfoOrderModel.length,
                              itemBuilder: (context, index) {
                                final place = state
                                    .mapPlaceAndListInfoOrderModel.keys
                                    .toList()[index];
                                List<InfoOrderModel> listWithOrders = state
                                        .mapPlaceAndListInfoOrderModel[place] ??
                                    [];
                                return myTextButton(
                                  child: CardAboutTask(
                                    aboutOrders: listWithOrders.first,
                                    lengthAboutOrders: listWithOrders.length,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => MultiBlocProvider(
                                          providers: [
                                            BlocProvider<ListRoomsBloc>.value(
                                              value: listRoomsBloc,
                                            ),
                                            BlocProvider<AboutTaskBlocs>.value(
                                              value: blocAboutTasks,
                                            ),
                                          ],
                                          child: OrdersToFulfillPage(
                                            listWithOrders: listWithOrders,
                                            title: widget.title,
                                            location: widget.location,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          )
                        : Center(
                            child: IconAndMessage(
                              message: "Нет заданий в этом помещении",
                              icon: Icon(
                                Icons.no_encryption_outlined,
                                color: theme.textTheme.bodySmall!.color!,
                                size: 150,
                              ),
                            ),
                          );
                  } else if (state is LoadingListAboutTasksInitialState) {
                    return const IconAndMessage(message: "Загрузка задач");
                  } else if (state is ErrorListAboutTasksInitialState) {
                    return IconAndMessage(
                        icon: Icon(
                          Icons.error_outline,
                          size: 50,
                        ),
                        message:
                            "Ошибка получения данных\n\n${state.errorMessage}");
                  } else {
                    return IconAndMessage(
                      message: "Выберите помещение и нажмите ПОЛУЧИТь",
                      icon: Icon(
                        Icons.add_location_alt_outlined,
                        color: theme.textTheme.bodySmall!.color!,
                        size: 150,
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyButton(
                    customBackgroundColor: Colors.white,
                    child: Text(
                      'ПОЛУЧИТЬ',
                      style:
                          myTextStyleFontS8Sans(context: context, fontSize: 16),
                    ),
                    onTap: () {
                      if (listRoomsBloc.state.room != null) {
                        blocAboutTasks.add(
                          GetListAboutTasksEvent(
                            location: widget.location,
                            userName: context.read<AuthBloc>().state.userName!,
                            password: context.read<AuthBloc>().state.password!,
                            room: listRoomsBloc.state.room!,
                          ),
                        );
                      }
                    },
                  ),
                  // MyButton(
                  //   customBackgroundColor: Colors.white,
                  //   child: Text(
                  //     'БАЛАНС',
                  //     style:
                  //         myTextStyleFontS8Sans(context: context, fontSize: 16),
                  //   ),
                  //   onTap: () {},
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
